@interface NSArray
- (BOOL)tui_hasProperty:(id)a3;
- (id)tui_firstObjectPassingTest:(id)a3;
- (id)tui_objectAtIndex:(int64_t)a3;
- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4;
- (id)tui_valueForProperty:(id)a3;
@end

@implementation NSArray

- (id)tui_firstObjectPassingTest:(id)a3
{
  v4 = (uint64_t (**)(id, void *, void))a3;
  if ([(NSArray *)self count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      v6 = [(NSArray *)self objectAtIndexedSubscript:v5];
      if (v4[2](v4, v6, v5)) {
        break;
      }

      if (++v5 >= [(NSArray *)self count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (BOOL)tui_hasProperty:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"empty"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"count"];
  }

  return v4;
}

- (id)tui_valueForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"count"])
  {
    uint64_t v5 = +[NSNumber numberWithUnsignedInteger:[(NSArray *)self count]];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"empty"])
  {
    uint64_t v5 = +[NSNumber numberWithInt:[(NSArray *)self count] == 0];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)tui_objectAtIndex:(int64_t)a3
{
  NSUInteger v5 = [(NSArray *)self count];
  v6 = 0;
  int64_t v7 = (v5 & (a3 >> 63)) + a3;
  if (v7 >= 0 && v7 < v5)
  {
    v6 = -[NSArray objectAtIndex:](self, "objectAtIndex:");
  }

  return v6;
}

- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4
{
  NSUInteger v7 = [(NSArray *)self count];
  int64_t v8 = (v7 & (a3 >> 63)) + a3;
  if (v8 < 0)
  {
    v10 = 0;
  }
  else
  {
    NSUInteger v9 = v7;
    v10 = 0;
    if (v8 < v9)
    {
      int64_t v11 = (v9 & (a4 >> 63)) + a4;
      if ((v11 & 0x8000000000000000) == 0 && v11 < v9 && v8 <= v11)
      {
        v10 = -[NSArray subarrayWithRange:](self, "subarrayWithRange:");
      }
    }
  }

  return v10;
}

@end