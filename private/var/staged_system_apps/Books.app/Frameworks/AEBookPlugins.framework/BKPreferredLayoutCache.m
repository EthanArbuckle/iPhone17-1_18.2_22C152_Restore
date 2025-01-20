@interface BKPreferredLayoutCache
- (unint64_t)preferredDirectoryTypeForBook:(id)a3;
- (void)setPreferredDirectoryType:(unint64_t)a3 forBook:(id)a4;
@end

@implementation BKPreferredLayoutCache

- (unint64_t)preferredDirectoryTypeForBook:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  v5 = [v4 dictionaryForKey:@"_BKFixedLayoutPreferredTOCStyle"];
  v6 = sub_D6960(v3);

  v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 unsignedIntegerValue];

  return (unint64_t)v8;
}

- (void)setPreferredDirectoryType:(unint64_t)a3 forBook:(id)a4
{
  id v5 = a4;
  id v12 = +[NSUserDefaults standardUserDefaults];
  v6 = [v12 dictionaryForKey:@"_BKFixedLayoutPreferredTOCStyle"];
  v7 = v6;
  if (!v6) {
    v6 = &__NSDictionary0__struct;
  }
  id v8 = [v6 mutableCopy];

  v9 = sub_D6960(v5);

  v10 = +[NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v10 forKeyedSubscript:v9];

  id v11 = [v8 copy];
  [v12 setValue:v11 forKey:@"_BKFixedLayoutPreferredTOCStyle"];
}

@end