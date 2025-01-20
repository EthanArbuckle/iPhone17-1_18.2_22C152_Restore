@interface FREditorialFontManager
- (BOOL)registerFontWithURL:(id)a3 error:(id *)a4;
- (void)unregisterFontWithURL:(id)a3;
@end

@implementation FREditorialFontManager

- (BOOL)registerFontWithURL:(id)a3 error:(id *)a4
{
  return +[FRFont registerFontWithURL:a3 error:a4];
}

- (void)unregisterFontWithURL:(id)a3
{
}

@end