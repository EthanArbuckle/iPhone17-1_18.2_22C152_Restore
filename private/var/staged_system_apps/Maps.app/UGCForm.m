@interface UGCForm
- (BOOL)isComplete;
- (NSString)parentSubmissionIdentifier;
- (UGCForm)init;
- (void)_notifyObserversOfChange;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setParentSubmissionIdentifier:(id)a3;
@end

@implementation UGCForm

- (UGCForm)init
{
  v6.receiver = self;
  v6.super_class = (Class)UGCForm;
  v2 = [(UGCForm *)&v6 init];
  if (v2)
  {
    v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UGCFormObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v3;
  }
  return v2;
}

- (BOOL)isComplete
{
  return 0;
}

- (void)_notifyObserversOfChange
{
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (NSString)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  self->_parentSubmissionIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
}

@end