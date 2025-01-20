@interface UAReceiver
- (BOOL)fetchMoreAppSuggestions;
- (BOOL)receiving;
- (BOOL)terminate;
- (NSSet)scanningForTypes;
- (UAReceiver)initWithManager:(id)a3 name:(id)a4;
- (id)receivedItems;
- (id)statusString;
- (void)setScanningForTypes:(id)a3;
@end

@implementation UAReceiver

- (UAReceiver)initWithManager:(id)a3 name:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UAReceiver;
  return [(UACornerActionManagerHandler *)&v5 initWithManager:a3 name:a4];
}

- (BOOL)receiving
{
  return 0;
}

- (id)receivedItems
{
  return 0;
}

- (BOOL)fetchMoreAppSuggestions
{
  return 0;
}

- (BOOL)terminate
{
  v6.receiver = self;
  v6.super_class = (Class)UAReceiver;
  BOOL v3 = [(UACornerActionManagerHandler *)&v6 terminate];
  if (v3)
  {
    v4 = [(UACornerActionManagerHandler *)self manager];
    [v4 removeReceiver:self];
  }
  return v3;
}

- (id)statusString
{
  return +[NSString stringWithFormat:@"%s: %@\n", object_getClassName(self), self];
}

- (NSSet)scanningForTypes
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setScanningForTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end