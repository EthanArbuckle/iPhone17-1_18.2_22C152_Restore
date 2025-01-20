@interface NSAttributedString(_UITextSearchingStyles)
+ (id)_systemTextSearchTextAttributesForStyle:()_UITextSearchingStyles;
@end

@implementation NSAttributedString(_UITextSearchingStyles)

+ (id)_systemTextSearchTextAttributesForStyle:()_UITextSearchingStyles
{
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a3 == 2)
  {
    uint64_t v5 = +[UIColor yellowColor];
  }
  else if (a3 == 1)
  {
    uint64_t v5 = +[UIColor lightGrayColor];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    uint64_t v5 = +[UIColor clearColor];
  }
  v6 = (void *)v5;
  [v4 setObject:v5 forKeyedSubscript:*(void *)off_1E52D1F58];

LABEL_8:
  return v4;
}

@end