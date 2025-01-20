@interface NMSMediaContainerQuotaData
- (BOOL)hasItemsAboveQuota;
- (BOOL)hasRemovedItems;
- (BOOL)hasSkippedItems;
- (id)quotaRefObj;
- (unint64_t)numItemsAdded;
- (void)setHasRemovedItems:(BOOL)a3;
- (void)setHasSkippedItems:(BOOL)a3;
- (void)setNumItemsAdded:(unint64_t)a3;
- (void)setQuotaRefObj:(id)a3;
@end

@implementation NMSMediaContainerQuotaData

- (BOOL)hasItemsAboveQuota
{
  if ([(NMSMediaContainerQuotaData *)self hasSkippedItems]) {
    return 1;
  }

  return [(NMSMediaContainerQuotaData *)self hasRemovedItems];
}

- (id)quotaRefObj
{
  id WeakRetained = objc_loadWeakRetained(&self->_quotaRefObj);

  return WeakRetained;
}

- (void)setQuotaRefObj:(id)a3
{
}

- (unint64_t)numItemsAdded
{
  return self->_numItemsAdded;
}

- (void)setNumItemsAdded:(unint64_t)a3
{
  self->_numItemsAdded = a3;
}

- (BOOL)hasSkippedItems
{
  return self->_hasSkippedItems;
}

- (void)setHasSkippedItems:(BOOL)a3
{
  self->_hasSkippedItems = a3;
}

- (BOOL)hasRemovedItems
{
  return self->_hasRemovedItems;
}

- (void)setHasRemovedItems:(BOOL)a3
{
  self->_hasRemovedItems = a3;
}

- (void).cxx_destruct
{
}

@end