@interface NSCoder(PUIAdditions)
- (id)pui_decodeStyleForKey:()PUIAdditions error:;
- (void)pui_encodeStyle:()PUIAdditions forKey:error:;
@end

@implementation NSCoder(PUIAdditions)

- (void)pui_encodeStyle:()PUIAdditions forKey:error:
{
  id v9 = a4;
  v8 = +[PUIStyleSerialization dataForStyle:a3 error:a5];
  if (v8) {
    [a1 encodeObject:v8 forKey:v9];
  }
}

- (id)pui_decodeStyleForKey:()PUIAdditions error:
{
  id v6 = a3;
  v7 = self;
  v8 = [a1 decodeObjectOfClass:v7 forKey:v6];

  if (v8)
  {
    id v9 = +[PUIStyleSerialization styleForData:v8 error:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end