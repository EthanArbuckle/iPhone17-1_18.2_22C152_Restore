@interface PVTaskToken
- (BOOL)returned;
- (PVTaskToken)initWithPool:(id)a3 tokenId:(unint64_t)a4;
- (PVTaskTokenPool)pool;
- (unint64_t)tokenId;
- (void)dealloc;
- (void)returnToPool;
- (void)setReturned:(BOOL)a3;
@end

@implementation PVTaskToken

- (void)returnToPool
{
  v3 = [(PVTaskToken *)self pool];

  if (v3)
  {
    id v4 = [(PVTaskToken *)self pool];
    [v4 returnToken:self];
  }
}

- (PVTaskToken)initWithPool:(id)a3 tokenId:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PVTaskToken;
  v7 = [(PVTaskToken *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_pool, v6);
    v8->_tokenId = a4;
    [(PVTaskToken *)v8 setReturned:0];
  }

  return v8;
}

- (void)dealloc
{
  if (![(PVTaskToken *)self returned]) {
    [(PVTaskToken *)self returnToPool];
  }
  v3.receiver = self;
  v3.super_class = (Class)PVTaskToken;
  [(PVTaskToken *)&v3 dealloc];
}

- (PVTaskTokenPool)pool
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pool);

  return (PVTaskTokenPool *)WeakRetained;
}

- (unint64_t)tokenId
{
  return self->_tokenId;
}

- (BOOL)returned
{
  return self->_returned;
}

- (void)setReturned:(BOOL)a3
{
  self->_returned = a3;
}

- (void).cxx_destruct
{
}

@end