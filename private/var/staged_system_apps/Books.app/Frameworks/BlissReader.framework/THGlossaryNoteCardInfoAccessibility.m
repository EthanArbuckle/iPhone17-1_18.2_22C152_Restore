@interface THGlossaryNoteCardInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxBackDescription;
- (NSString)thaxBackHint;
- (NSString)thaxFrontDescription;
- (NSString)thaxFrontHint;
- (THModelGlossaryEntryAccessibility)_thaxGlossaryEntry;
@end

@implementation THGlossaryNoteCardInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"THGlossaryNoteCardInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxFrontDescription
{
  return +[NSString stringWithFormat:THAccessibilityLocalizedString(@"study.card.glossary.term.format %@"), [(THModelGlossaryEntryAccessibility *)[(THGlossaryNoteCardInfoAccessibility *)self _thaxGlossaryEntry] thaxTerm]];
}

- (NSString)thaxFrontHint
{
  return THAccessibilityLocalizedString(@"study.card.glossary.term.hint.ios");
}

- (NSString)thaxBackDescription
{
  return +[NSString stringWithFormat:THAccessibilityLocalizedString(@"study.card.glossary.definition.format %@"), [(THModelGlossaryEntryAccessibility *)[(THGlossaryNoteCardInfoAccessibility *)self _thaxGlossaryEntry] thaxDefinition]];
}

- (NSString)thaxBackHint
{
  return THAccessibilityLocalizedString(@"study.card.glossary.definition.hint.ios");
}

- (THModelGlossaryEntryAccessibility)_thaxGlossaryEntry
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THModelGlossaryEntryAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THGlossaryNoteCardInfoAccessibility *)self tsaxValueForKey:@"glossaryEntry"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end