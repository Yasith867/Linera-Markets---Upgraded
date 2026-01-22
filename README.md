# Linera Markets (Vercel + Railway)

This repo is split into:

- `frontend/` (Vite + React) → deploy to **Vercel**
- `backend/` (Express API) → deploy to **Railway**
- `shared/` (types + schemas) → imported by both

## Deploy Backend to Railway

1. Create a new Railway project from this GitHub repo.
2. Set **Root Directory** to `backend`
3. Railway will run:
   - Build: `npm run build`
   - Start: `npm start`
4. Add environment variables in Railway (at least):
   - `DATABASE_URL` (if you use Postgres)
   - any others your app needs

Health check:
- `GET /health` should return `{ ok: true }`

## Deploy Frontend to Vercel

1. Import the same GitHub repo into Vercel.
2. Set **Root Directory** to `frontend`
3. Set Environment Variable:
   - `BACKEND_URL` = your Railway public URL, including `https://`
     Example: `https://xxxx.up.railway.app`
4. Deploy.

The frontend proxies `/api/*` → Railway using `frontend/vercel.json`, so your existing frontend code can keep calling `/api/...`.

## Local Dev

Backend:
```bash
cd backend
npm install
npm run dev
```

Frontend (in another terminal):
```bash
cd frontend
npm install
npm run dev
```

In local dev, set Vite proxy (optional) or call `http://localhost:5000` directly.
