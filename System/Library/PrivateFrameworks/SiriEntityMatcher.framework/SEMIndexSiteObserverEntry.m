@interface SEMIndexSiteObserverEntry
- (SEMIndexSiteAvailabilityObserver)observer;
- (id)description;
- (void)setObserver:(id)a3;
@end

@implementation SEMIndexSiteObserverEntry

- (id)description
{
  v4 = NSString;
  v5 = objc_msgSend_observer(self, a2, v2, v3);
  v8 = objc_msgSend_stringWithFormat_(v4, v6, @"Observer: %@", v7, v5);

  return v8;
}

- (SEMIndexSiteAvailabilityObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (SEMIndexSiteAvailabilityObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end