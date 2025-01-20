@interface SASBulletinCache
- (BOOL)_isFeedRelevant:(unint64_t)a3;
- (BOOL)removeBulletinForID:(id)a3;
- (SASBulletinCache)init;
- (id)_findNodeForBulletinID:(id)a3;
- (id)allBulletins;
- (id)cachedBulletinForID:(id)a3;
- (void)_deleteNode:(id)a3;
- (void)_purgeOldestNodes;
- (void)insertBulletin:(id)a3 fromFeed:(unint64_t)a4;
@end

@implementation SASBulletinCache

- (SASBulletinCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)SASBulletinCache;
  v2 = [(SASBulletinCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    oldestNode = v2->_oldestNode;
    v2->_count = 0;
    v2->_oldestNode = 0;

    newestNode = v3->_newestNode;
    v3->_newestNode = 0;
  }
  return v3;
}

- (void)insertBulletin:(id)a3 fromFeed:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = [v6 bulletinID];

  if (v7)
  {
    os_unfair_lock_lock(&cacheLock);
    if ([(SASBulletinCache *)self _isFeedRelevant:a4])
    {
      v8 = [v6 bulletinID];
      v9 = [(SASBulletinCache *)self _findNodeForBulletinID:v8];

      if (v9) {
        [(SASBulletinCache *)self _deleteNode:v9];
      }
      if (self->_count >= 0x19) {
        [(SASBulletinCache *)self _purgeOldestNodes];
      }
      v10 = objc_alloc_init(SASBulletinCacheNode);
      [(SASBulletinCacheNode *)v10 setBulletin:v6];
      if (!self->_oldestNode) {
        objc_storeStrong((id *)&self->_oldestNode, v10);
      }
      if (self->_newestNode)
      {
        -[SASBulletinCacheNode setPreviousNode:](v10, "setPreviousNode:");
        [(SASBulletinCacheNode *)self->_newestNode setNextNode:v10];
      }
      newestNode = self->_newestNode;
      self->_newestNode = v10;

      ++self->_count;
    }
    os_unfair_lock_unlock(&cacheLock);
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      -[SASBulletinCache insertBulletin:fromFeed:](v6, v12);
    }
  }
}

- (BOOL)removeBulletinForID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&cacheLock);
  v5 = [(SASBulletinCache *)self _findNodeForBulletinID:v4];

  if (v5) {
    [(SASBulletinCache *)self _deleteNode:v5];
  }
  os_unfair_lock_unlock(&cacheLock);

  return v5 != 0;
}

- (id)allBulletins
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock(&cacheLock);
  id v4 = self->_oldestNode;
  v5 = (os_log_t *)MEMORY[0x1E4F4E360];
  *(void *)&long long v6 = 136315650;
  long long v15 = v6;
  do
  {
    objc_super v7 = [(SASBulletinCacheNode *)v4 bulletin];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 bulletinID];
      if (v9)
      {
        [v3 setObject:v8 forKey:v9];
      }
      else
      {
        os_log_t v10 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v12 = v10;
          v13 = [v8 bbBulletin];
          *(_DWORD *)buf = v15;
          v17 = "-[SASBulletinCache allBulletins]";
          __int16 v18 = 2112;
          v19 = v8;
          __int16 v20 = 2112;
          v21 = v13;
          _os_log_error_impl(&dword_1D9588000, v12, OS_LOG_TYPE_ERROR, "%s Bulletin cache contains a bulletin with a nil identifier; not including the bulletin as part of the retur"
            "n value of -allBulletins (bulletin: %@; bbBulletin: %@)",
            buf,
            0x20u);
        }
      }
    }
    uint64_t v11 = [(SASBulletinCacheNode *)v4 nextNode];

    id v4 = (SASBulletinCacheNode *)v11;
  }
  while (v11);
  os_unfair_lock_unlock(&cacheLock);
  return v3;
}

- (id)cachedBulletinForID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&cacheLock);
  v5 = [(SASBulletinCache *)self _findNodeForBulletinID:v4];

  long long v6 = [v5 bulletin];
  os_unfair_lock_unlock(&cacheLock);

  return v6;
}

- (id)_findNodeForBulletinID:(id)a3
{
  id v4 = a3;
  v5 = self->_oldestNode;
  do
  {
    long long v6 = [(SASBulletinCacheNode *)v5 bulletin];
    objc_super v7 = [v6 bulletinID];
    char v8 = [v7 isEqualToString:v4];

    if (v8) {
      break;
    }
    uint64_t v9 = [(SASBulletinCacheNode *)v5 nextNode];

    v5 = (SASBulletinCacheNode *)v9;
  }
  while (v9);

  return v5;
}

- (void)_deleteNode:(id)a3
{
  id v4 = a3;
  id v10 = [v4 previousNode];
  v5 = [v4 nextNode];
  [v10 setNextNode:v5];
  [v5 setPreviousNode:v10];
  long long v6 = [v4 previousNode];

  if (!v6) {
    objc_storeStrong((id *)&self->_oldestNode, v5);
  }
  objc_super v7 = [v4 nextNode];

  if (!v7)
  {
    char v8 = [v4 previousNode];
    newestNode = self->_newestNode;
    self->_newestNode = v8;
  }
  [v4 setBulletin:0];
  [v4 setPreviousNode:0];
  [v4 setNextNode:0];

  --self->_count;
}

- (void)_purgeOldestNodes
{
  if (self->_count >= 0x19)
  {
    do
      [(SASBulletinCache *)self _deleteNode:self->_oldestNode];
    while (self->_count > 0x18);
  }
}

- (BOOL)_isFeedRelevant:(unint64_t)a3
{
  return (a3 & 9) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newestNode, 0);
  objc_storeStrong((id *)&self->_oldestNode, 0);
}

- (void)insertBulletin:(void *)a1 fromFeed:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = [a1 bbBulletin];
  int v5 = 136315650;
  long long v6 = "-[SASBulletinCache insertBulletin:fromFeed:]";
  __int16 v7 = 2112;
  char v8 = a1;
  __int16 v9 = 2112;
  id v10 = v4;
  _os_log_error_impl(&dword_1D9588000, v3, OS_LOG_TYPE_ERROR, "%s Bulletin cache is being asked to insert a bulletin with no ID; ignoring the request because bulletin lookup is ID"
    "-based and so there's no reason to store a bulletin with no ID (bulletin: %@; bbBulletin: %@)",
    (uint8_t *)&v5,
    0x20u);
}

@end