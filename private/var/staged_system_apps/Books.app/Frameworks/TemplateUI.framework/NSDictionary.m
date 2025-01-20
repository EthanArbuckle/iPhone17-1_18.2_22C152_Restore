@interface NSDictionary
- (BOOL)tui_hasProperty:(id)a3;
- (id)dictionaryByAddingEntriesFromDictionary:(id)a3;
- (id)tui_valueForProperty:(id)a3;
@end

@implementation NSDictionary

- (BOOL)tui_hasProperty:(id)a3
{
  return a3 != 0;
}

- (id)tui_valueForProperty:(id)a3
{
  if (a3)
  {
    v4 = -[NSDictionary objectForKey:](self, "objectForKey:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)dictionaryByAddingEntriesFromDictionary:(id)a3
{
  v4 = self;
  if (a3)
  {
    id v5 = a3;
    v6 = (NSDictionary *)[(NSDictionary *)v4 mutableCopy];
    [(NSDictionary *)v6 addEntriesFromDictionary:v5];

    v4 = v6;
  }

  return v4;
}

@end