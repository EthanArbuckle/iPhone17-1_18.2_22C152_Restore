@interface SPZKWSession
- (id)queryTaskWithContext:(id)a3;
@end

@implementation SPZKWSession

- (id)queryTaskWithContext:(id)a3
{
  id v3 = a3;
  if (!v3) {
    id v3 = (id)objc_opt_new();
  }
  v4 = objc_opt_new();
  v5 = (void *)[objc_alloc(MEMORY[0x263F674C0]) initWithSearchQueryContext:v3];
  [v4 setQuery:v5];

  return v4;
}

@end