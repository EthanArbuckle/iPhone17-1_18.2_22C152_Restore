@interface PGDisplayLink
- (PGDisplayLink)initWithOwner:(id)a3 linkFired:(id)a4;
- (id)linkFired;
- (id)owner;
- (unint64_t)preferredFramesPerSecond;
- (void)_linkFired:(id)a3;
- (void)invalidate;
- (void)setPreferredFramesPerSecond:(unint64_t)a3;
@end

@implementation PGDisplayLink

- (PGDisplayLink)initWithOwner:(id)a3 linkFired:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGDisplayLink;
  v8 = [(PGDisplayLink *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_owner, v6);
    uint64_t v10 = MEMORY[0x1BA99D810](v7);
    id linkFired = v9->_linkFired;
    v9->_id linkFired = (id)v10;
  }
  return v9;
}

- (void)setPreferredFramesPerSecond:(unint64_t)a3
{
  if (self->_preferredFramesPerSecond == a3) {
    return;
  }
  self->_preferredFramesPerSecond = a3;
  if (self->_invalidated) {
    return;
  }
  link = self->_link;
  if (!a3)
  {
    uint64_t v6 = 1;
LABEL_9:
    [(CADisplayLink *)link setPaused:v6];
    return;
  }
  if (link)
  {
    [(CADisplayLink *)link setPreferredFramesPerSecond:a3];
    if (![(CADisplayLink *)self->_link isPaused]) {
      return;
    }
    link = self->_link;
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  id v7 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__linkFired_];
  v8 = self->_link;
  self->_link = v7;

  [(CADisplayLink *)self->_link setPreferredFramesPerSecond:a3];
  v9 = self->_link;
  id v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v9 addToRunLoop:v10 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)invalidate
{
  self->_invalidated = 1;
  [(CADisplayLink *)self->_link invalidate];
  link = self->_link;
  self->_link = 0;
}

- (void)_linkFired:(id)a3
{
  id v5 = [(PGDisplayLink *)self owner];
  if (v5)
  {
    v4 = [(PGDisplayLink *)self linkFired];
    ((void (**)(void, id, PGDisplayLink *))v4)[2](v4, v5, self);
  }
  else
  {
    [(PGDisplayLink *)self invalidate];
  }
}

- (id)owner
{
  id WeakRetained = objc_loadWeakRetained(&self->_owner);

  return WeakRetained;
}

- (id)linkFired
{
  return self->_linkFired;
}

- (unint64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_linkFired, 0);
  objc_destroyWeak(&self->_owner);

  objc_storeStrong((id *)&self->_link, 0);
}

@end