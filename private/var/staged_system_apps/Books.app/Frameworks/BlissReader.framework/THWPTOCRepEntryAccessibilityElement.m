@interface THWPTOCRepEntryAccessibilityElement
- (BOOL)accessibilityActivate;
- (CGRect)accessibilityFrame;
- (THTOCTileModelEntryAccessibility)tileModelEntry;
- (THWPTOCRepAccessibility)parentTOCRep;
- (THWPTOCRepEntryAccessibilityElement)initWithParentTOCRep:(id)a3 linkField:(id)a4 textRange:(_NSRange)a5 indexInTOC:(unint64_t)a6;
- (TSWPHyperlinkFieldAccessibility)linkField;
- (_NSRange)textRange;
- (id)accessibilityValue;
- (unint64_t)index;
- (void)dealloc;
- (void)setIndex:(unint64_t)a3;
- (void)setParentTOCRep:(id)a3;
@end

@implementation THWPTOCRepEntryAccessibilityElement

- (THWPTOCRepEntryAccessibilityElement)initWithParentTOCRep:(id)a3 linkField:(id)a4 textRange:(_NSRange)a5 indexInTOC:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v11 = -[THWPTOCRepEntryAccessibilityElement initWithAccessibilityContainer:](self, "initWithAccessibilityContainer:");
  v12 = v11;
  if (v11)
  {
    v11->_parentTOCRep = (THWPTOCRepAccessibility *)a3;
    v11->_linkField = (TSWPHyperlinkFieldAccessibility *)a4;
    v12->_textRange.NSUInteger location = location;
    v12->_textRange.NSUInteger length = length;
    v12->_index = a6;
  }
  return v12;
}

- (id)accessibilityValue
{
  v2 = [(THWPTOCRepEntryAccessibilityElement *)self tileModelEntry];
  v3 = +[NSString localizedStringWithFormat:THAccessibilityLocalizedString(@"toc.entry.section.number.format %@"), [(THTOCTileModelEntryAccessibility *)v2 thaxSectionIdentifier]];
  v4 = [(THTOCTileModelEntryAccessibility *)v2 thaxTitle];
  +[NSString localizedStringWithFormat:THAccessibilityLocalizedString(@"page.number %@"), [(THTOCTileModelEntryAccessibility *)v2 thaxDisplayPageNumber]];
  return __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (BOOL)accessibilityActivate
{
  v3 = [(THWPTOCRepAccessibility *)[(THWPTOCRepEntryAccessibilityElement *)self parentTOCRep] thaxChapterBrowserController];
  if (v3)
  {
    [(THChapterBrowserControllerAccessibility *)v3 thaxFollowLink:+[THModelLinkAccessibility thaxModelLinkForHyperlinkField:[(THWPTOCRepEntryAccessibilityElement *)self linkField]]];
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Couldn't find chapter browser controller, won't be able to follow link", v5, v6, v7, v8, v9, v11))abort(); {
  }
    }
  return v3 != 0;
}

- (CGRect)accessibilityFrame
{
  v3 = [(THWPTOCRepEntryAccessibilityElement *)self parentTOCRep];
  id v5 = [(THWPTOCRepEntryAccessibilityElement *)self textRange];

  -[TSWPRepAccessibility _accessibilityBoundsForRange:](v3, "_accessibilityBoundsForRange:", v5, v4);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (THTOCTileModelEntryAccessibility)tileModelEntry
{
  char v5 = 0;
  v3 = objc_opt_class();
  CGRect result = (THTOCTileModelEntryAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(NSArray *)[(THTOCTileModelAccessibility *)[(THWPTOCRepAccessibility *)[(THWPTOCRepEntryAccessibilityElement *)self parentTOCRep] thaxTileModel] thaxLandscapeEntries] objectAtIndexedSubscript:[(THWPTOCRepEntryAccessibilityElement *)self index]], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWPTOCRepEntryAccessibilityElement;
  [(THWPTOCRepEntryAccessibilityElement *)&v3 dealloc];
}

- (THWPTOCRepAccessibility)parentTOCRep
{
  return self->_parentTOCRep;
}

- (void)setParentTOCRep:(id)a3
{
  self->_parentTOCRep = (THWPTOCRepAccessibility *)a3;
}

- (TSWPHyperlinkFieldAccessibility)linkField
{
  return self->_linkField;
}

- (_NSRange)textRange
{
  p_textRange = &self->_textRange;
  NSUInteger location = self->_textRange.location;
  NSUInteger length = p_textRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end