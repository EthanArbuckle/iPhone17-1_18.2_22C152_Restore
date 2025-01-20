@interface UIDefinitionDictionary
@end

@implementation UIDefinitionDictionary

void __68___UIDefinitionDictionary__normalizedLanguageStringForLanguageCode___block_invoke()
{
  if (!_MergedGlobals_1008)
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1 = [v0 objectForKey:@"AppleLanguages"];
    v2 = [v1 objectAtIndex:0];

    id v3 = v2;
    [v3 UTF8String];
    _MergedGlobals_1008 = uldn_openForContext();
  }
}

@end