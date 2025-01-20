@interface PFSPage
- (NSMutableArray)flows;
- (NSMutableDictionary)properties;
- (NSMutableDictionary)slots;
- (PFSPage)init;
- (id)addSlotWithId:(id)a3;
- (id)slotWithId:(id)a3;
- (id)valueForProperty:(const char *)a3;
- (void)addFlow:(id)a3;
- (void)dealloc;
@end

@implementation PFSPage

- (PFSPage)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFSPage;
  v2 = [(PFSPage *)&v4 init];
  if (v2)
  {
    v2->mProperties = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mSlots = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mFlows = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFSPage;
  [(PFSPage *)&v3 dealloc];
}

- (id)valueForProperty:(const char *)a3
{
  objc_super v4 = +[NSString stringWithXmlString:a3];
  mProperties = self->mProperties;

  return [(NSMutableDictionary *)mProperties objectForKey:v4];
}

- (id)addSlotWithId:(id)a3
{
  v5 = [[PFSSlot alloc] initWithId:a3];
  [(NSMutableDictionary *)self->mSlots setObject:v5 forKey:a3];

  return v5;
}

- (id)slotWithId:(id)a3
{
  return [(NSMutableDictionary *)self->mSlots objectForKey:a3];
}

- (void)addFlow:(id)a3
{
}

- (NSMutableDictionary)properties
{
  return self->mProperties;
}

- (NSMutableDictionary)slots
{
  return self->mSlots;
}

- (NSMutableArray)flows
{
  return self->mFlows;
}

@end