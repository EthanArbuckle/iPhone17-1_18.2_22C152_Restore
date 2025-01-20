@interface UAActivityNotifier
- (BOOL)requiresBoosted;
- (NSSet)items;
- (NSSet)notifiedItems;
- (UAActivityNotifier)initWithManager:(id)a3 name:(id)a4;
@end

@implementation UAActivityNotifier

- (NSSet)notifiedItems
{
  return 0;
}

- (NSSet)items
{
  return 0;
}

- (BOOL)requiresBoosted
{
  return 0;
}

- (UAActivityNotifier)initWithManager:(id)a3 name:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UAActivityNotifier;
  return [(UACornerActionManagerHandler *)&v5 initWithManager:a3 name:a4];
}

@end