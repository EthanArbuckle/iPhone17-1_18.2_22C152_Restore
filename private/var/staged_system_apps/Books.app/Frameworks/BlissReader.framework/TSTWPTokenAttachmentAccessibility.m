@interface TSTWPTokenAttachmentAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxHasMenu;
- (BOOL)tsaxIsMovingReferenceToken;
- (CGRect)tsaxMenuFrame;
- (NSArray)tsaxReferencedCells;
- (NSString)tsaxFormulaPlainText;
- (NSString)tsaxLabel;
- (NSString)tsaxRoleDescription;
- (TSTTableRepAccessibility)_tsaxTableRep;
- (id)_tsaxExpressionNode;
- (id)_tsaxReferenceNode;
- (void)tsaxSetMovingReferenceToken:(BOOL)a3;
@end

@implementation TSTWPTokenAttachmentAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTWPTokenAttachment";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxIsMovingReferenceToken
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738C7);
}

- (void)tsaxSetMovingReferenceToken:(BOOL)a3
{
}

- (id)_tsaxExpressionNode
{
  return [(TSTWPTokenAttachmentAccessibility *)self tsaxValueForKey:@"expressionNode"];
}

- (id)_tsaxReferenceNode
{
  id v2 = [(TSTWPTokenAttachmentAccessibility *)self _tsaxExpressionNode];
  NSClassFromString(@"TSTReferenceNode");
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (TSTTableRepAccessibility)_tsaxTableRep
{
  id v2 = [(TSWPRepAccessibility *)[(TSWPAttachmentAccessibility *)self tsaxParentTextRep] tsaxEditingController];
  char v6 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v6);
  if (v6) {
    abort();
  }
  return (TSTTableRepAccessibility *)[(objc_class *)v4 tsaxTableRep];
}

- (NSString)tsaxFormulaPlainText
{
  return (NSString *)[(TSTWPTokenAttachmentAccessibility *)self tsaxValueForKey:@"formulaPlainText"];
}

- (NSString)tsaxRoleDescription
{
  id v2 = [(TSTWPTokenAttachmentAccessibility *)self _tsaxExpressionNode];
  NSClassFromString(@"TSTReferenceNode");
  if (objc_opt_isKindOfClass())
  {
    if ([v2 tsaxBoolValueForKey:@"isBlankForKeyboardInsertion"]) {
      return (NSString *)&stru_46D7E8;
    }
    if ([v2 tsaxBoolValueForKey:@"isRange"]) {
      CFStringRef v4 = @"formula.token.range.role.description";
    }
    else {
      CFStringRef v4 = @"formula.token.cell.role.description";
    }
  }
  else
  {
    NSClassFromString(@"TSTFunctionNode");
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v4 = @"formula.token.function.role.description";
    }
    else
    {
      NSClassFromString(@"TSTArgumentPlaceholderNode");
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSClassFromString(@"TSTFunctionEndNode");
        if (objc_opt_isKindOfClass()) {
          return (NSString *)&stru_46D7E8;
        }
        else {
          return 0;
        }
      }
      CFStringRef v4 = @"formula.token.function.argument.placeholder.role.description";
    }
  }

  return TSAccessibilityLocalizedString((uint64_t)v4);
}

- (NSString)tsaxLabel
{
  id v3 = [(TSTWPTokenAttachmentAccessibility *)self _tsaxExpressionNode];
  NSClassFromString(@"TSTReferenceNode");
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ![v3 tsaxBoolValueForKey:@"isBlankForKeyboardInsertion"])
  {
    v5 = [(TSTWPTokenAttachmentAccessibility *)self tsaxFormulaPlainText];
    NSClassFromString(@"TSTFunctionEndNode");
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return v5;
    }
    id v6 = [v3 tsaxValueForKey:@"functionNode"];
    char v14 = 0;
    v7 = (objc_class *)objc_opt_class();
    v8 = (void *)__TSAccessibilityCastAsClass(v7, (uint64_t)[v6 tsaxValueForKey:@"formulaPlainText"], 1, &v14);
    if (v14) {
      abort();
    }
    v9 = v8;
    v10 = (char *)[v8 length];
    if (!v10) {
      return v5;
    }
    v11 = v10;
    v12 = v10 - 1;
    if (objc_msgSend(objc_msgSend(v9, "substringFromIndex:", v10 - 1), "isEqualToString:", @"("))
    {
      id v13 = [v9 substringToIndex:v12];
      if (v11 == (unsigned char *)&dword_0 + 1) {
        return v5;
      }
      v9 = v13;
    }
    return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"formula.token.function.end.title.format %@"), v9];
  }

  return TSAccessibilityLocalizedString(@"formula.token.blank.for.keyboard.insertion.title");
}

- (NSArray)tsaxReferencedCells
{
  return 0;
}

- (BOOL)tsaxHasMenu
{
  return [(TSTWPTokenAttachmentAccessibility *)self tsaxBoolValueForKey:@"hasMenu"];
}

- (CGRect)tsaxMenuFrame
{
  [(TSTWPTokenAttachmentAccessibility *)self tsaxCGRectValueForKey:@"menuRect"];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end