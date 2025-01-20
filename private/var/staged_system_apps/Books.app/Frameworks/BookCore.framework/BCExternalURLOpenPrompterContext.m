@interface BCExternalURLOpenPrompterContext
+ (id)sharedContextForOpening;
- (BCExternalURLOpenPrompterContext)init;
- (BOOL)cacheResponses;
- (NSCache)responseCache;
- (_BCExternalURLOpenPrompterResponseValue)dummyCacheValue;
- (void)_resetResponseCache;
- (void)setCacheResponses:(BOOL)a3;
- (void)setDummyCacheValue:(id)a3;
- (void)setResponseCache:(id)a3;
@end

@implementation BCExternalURLOpenPrompterContext

+ (id)sharedContextForOpening
{
  if (qword_3492C0 != -1) {
    dispatch_once(&qword_3492C0, &stru_2C99A0);
  }
  v2 = (void *)qword_3492C8;

  return v2;
}

- (BCExternalURLOpenPrompterContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)BCExternalURLOpenPrompterContext;
  result = [(BCExternalURLOpenPrompterContext *)&v3 init];
  if (result) {
    result->_cacheResponses = 1;
  }
  return result;
}

- (NSCache)responseCache
{
  if (self->_cacheResponses && !self->_responseCache)
  {
    objc_super v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    [(NSCache *)v3 setTotalCostLimit:0x100000];
    responseCache = self->_responseCache;
    self->_responseCache = v3;

    v5 = objc_alloc_init(_BCExternalURLOpenPrompterResponseValue);
    dummyCacheValue = self->_dummyCacheValue;
    self->_dummyCacheValue = v5;
  }
  v7 = self->_responseCache;

  return v7;
}

- (void)setCacheResponses:(BOOL)a3
{
  if (self->_cacheResponses != a3)
  {
    self->_cacheResponses = a3;
    if (!a3)
    {
      self->_responseCache = 0;
      _objc_release_x1();
    }
  }
}

- (void)_resetResponseCache
{
  id v2 = [(BCExternalURLOpenPrompterContext *)self responseCache];
  [v2 removeAllObjects];
}

- (_BCExternalURLOpenPrompterResponseValue)dummyCacheValue
{
  return self->_dummyCacheValue;
}

- (void)setDummyCacheValue:(id)a3
{
}

- (void)setResponseCache:(id)a3
{
}

- (BOOL)cacheResponses
{
  return self->_cacheResponses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCache, 0);

  objc_storeStrong((id *)&self->_dummyCacheValue, 0);
}

@end