@interface UAAdvertiser
- (BOOL)advertising;
- (BOOL)okToSuspendAdvertising;
- (BOOL)shouldAdvertiseAutoPullActivityList;
- (BOOL)terminate;
- (BOOL)updateItem:(id)a3;
- (NSArray)advertisableItems;
- (NSArray)advertisingItems;
- (NSSet)pairedDevices;
- (UAAdvertiser)initWithManager:(id)a3 name:(id)a4;
- (id)statusString;
- (void)setShouldAdvertiseAutoPullActivityList:(BOOL)a3;
@end

@implementation UAAdvertiser

- (UAAdvertiser)initWithManager:(id)a3 name:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UAAdvertiser;
  return [(UACornerActionManagerHandler *)&v5 initWithManager:a3 name:a4];
}

- (BOOL)updateItem:(id)a3
{
  return 0;
}

- (BOOL)advertising
{
  return 0;
}

- (NSArray)advertisableItems
{
  return 0;
}

- (NSSet)pairedDevices
{
  return 0;
}

- (NSArray)advertisingItems
{
  return 0;
}

- (BOOL)okToSuspendAdvertising
{
  return 1;
}

- (BOOL)terminate
{
  v6.receiver = self;
  v6.super_class = (Class)UAAdvertiser;
  BOOL v3 = [(UACornerActionManagerHandler *)&v6 terminate];
  if (v3)
  {
    v4 = [(UACornerActionManagerHandler *)self manager];
    [v4 removeAdvertiser:self];
  }
  return v3;
}

- (id)statusString
{
  return +[NSString stringWithFormat:@"%s: %@\n", object_getClassName(self), self];
}

- (BOOL)shouldAdvertiseAutoPullActivityList
{
  return self->_shouldAdvertiseAutoPullActivityList;
}

- (void)setShouldAdvertiseAutoPullActivityList:(BOOL)a3
{
  self->_shouldAdvertiseAutoPullActivityList = a3;
}

@end