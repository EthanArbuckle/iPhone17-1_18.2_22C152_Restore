@interface _UIPencilEventDeliveryRecord
- (_UIPencilEventDeliveryRecord)init;
- (id)description;
@end

@implementation _UIPencilEventDeliveryRecord

- (_UIPencilEventDeliveryRecord)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPencilEventDeliveryRecord;
  v2 = [(_UIPencilEventDeliveryRecord *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mutableInteractions = v2->_mutableInteractions;
    v2->_mutableInteractions = (NSMutableSet *)v3;
  }
  return v2;
}

- (id)description
{
  return (id)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void).cxx_destruct
{
}

@end