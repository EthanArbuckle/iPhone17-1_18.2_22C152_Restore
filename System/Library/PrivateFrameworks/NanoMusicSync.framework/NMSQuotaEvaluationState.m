@interface NMSQuotaEvaluationState
- (NMSQuotaEvaluationState)initWithCurrentItem:(id)a3 downloadInfo:(id)a4;
- (NSNumber)mediaLibraryIdentifier;
- (NSString)externalLibraryIdentifier;
- (int64_t)containerIndex;
- (int64_t)itemIndex;
- (unint64_t)itemSize;
- (unint64_t)listQuota;
- (unint64_t)listTotalSize;
- (void)setContainerIndex:(int64_t)a3;
- (void)setExternalLibraryIdentifier:(id)a3;
- (void)setItemIndex:(int64_t)a3;
- (void)setItemSize:(unint64_t)a3;
- (void)setListQuota:(unint64_t)a3;
- (void)setListTotalSize:(unint64_t)a3;
- (void)setMediaLibraryIdentifier:(id)a3;
@end

@implementation NMSQuotaEvaluationState

- (NMSQuotaEvaluationState)initWithCurrentItem:(id)a3 downloadInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NMSQuotaEvaluationState;
  v8 = [(NMSQuotaEvaluationState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 mediaLibraryIdentifier];
    mediaLibraryIdentifier = v8->_mediaLibraryIdentifier;
    v8->_mediaLibraryIdentifier = (NSNumber *)v9;

    uint64_t v11 = [v6 externalLibraryIdentifier];
    externalLibraryIdentifier = v8->_externalLibraryIdentifier;
    v8->_externalLibraryIdentifier = (NSString *)v11;

    v8->_itemSize = [v6 size];
    v8->_listTotalSize = [v7 totalItemSize];
  }

  return v8;
}

- (NSNumber)mediaLibraryIdentifier
{
  return self->_mediaLibraryIdentifier;
}

- (void)setMediaLibraryIdentifier:(id)a3
{
}

- (NSString)externalLibraryIdentifier
{
  return self->_externalLibraryIdentifier;
}

- (void)setExternalLibraryIdentifier:(id)a3
{
}

- (unint64_t)itemSize
{
  return self->_itemSize;
}

- (void)setItemSize:(unint64_t)a3
{
  self->_itemSize = a3;
}

- (unint64_t)listTotalSize
{
  return self->_listTotalSize;
}

- (void)setListTotalSize:(unint64_t)a3
{
  self->_listTotalSize = a3;
}

- (unint64_t)listQuota
{
  return self->_listQuota;
}

- (void)setListQuota:(unint64_t)a3
{
  self->_listQuota = a3;
}

- (int64_t)containerIndex
{
  return self->_containerIndex;
}

- (void)setContainerIndex:(int64_t)a3
{
  self->_containerIndex = a3;
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(int64_t)a3
{
  self->_itemIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalLibraryIdentifier, 0);

  objc_storeStrong((id *)&self->_mediaLibraryIdentifier, 0);
}

@end