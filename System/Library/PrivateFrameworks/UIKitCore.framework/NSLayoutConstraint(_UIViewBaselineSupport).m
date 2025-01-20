@interface NSLayoutConstraint(_UIViewBaselineSupport)
- (uint64_t)_debuggableEquationBaseDescription;
- (uint64_t)_debuggableEquationDescriptionWithoutLegend;
- (uint64_t)_debuggableEquationLegendDescription;
@end

@implementation NSLayoutConstraint(_UIViewBaselineSupport)

- (uint64_t)_debuggableEquationBaseDescription
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  int v4 = [(NSString *)v3 isEqual:@"NSAutoresizingMaskLayoutConstraint"];
  v5 = @"NSAutoResizeMaskCn";
  if (!v4) {
    v5 = (__CFString *)v3;
  }
  return [NSString stringWithFormat:@"<%@: %p>  ::  ", v5, a1];
}

- (uint64_t)_debuggableEquationLegendDescription
{
  v2 = 0;
  switch([a1 _constraintType])
  {
    case 3u:
    case 9u:
      v3 = (void *)[a1 firstItem];
      goto LABEL_4;
    case 4u:
    case 0xAu:
      v3 = (void *)[a1 secondItem];
LABEL_4:
      v2 = objc_msgSend(v3, "nsli_superitem");
      break;
    default:
      break;
  }
  int v4 = (void *)[a1 firstItem];
  if (objc_msgSend(v4, "nsli_descriptionIncludesPointer")) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "nsli_description"), "stringByAppendingFormat:", @":%p", v4);
  }
  uint64_t v6 = [a1 firstItem];
  if (v6 == [a1 secondItem]
    || (v7 = (void *)[a1 secondItem], (objc_msgSend(v7, "nsli_descriptionIncludesPointer") & 1) != 0))
  {
    uint64_t v8 = 0;
    if (!v2) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "nsli_description"), "stringByAppendingFormat:", @":%p", v7);
    if (!v2) {
      goto LABEL_16;
    }
  }
  v9 = NSString;
  char v10 = objc_msgSend(v2, "nsli_descriptionIncludesPointer");
  v11 = objc_msgSend(v2, "nsli_description");
  if ((v10 & 1) == 0) {
    v11 = objc_msgSend(v11, "stringByAppendingFormat:", @":%p", v2);
  }
  v2 = (void *)[v9 stringWithFormat:@"'|':%@", v11];
LABEL_16:
  v12 = (void *)[MEMORY[0x1E4F1CA48] array];
  v13 = v12;
  if (v5) {
    [v12 addObject:v5];
  }
  if (v8) {
    [v13 addObject:v8];
  }
  if (v2) {
    [v13 addObject:v2];
  }
  v14 = (void *)[a1 _debuggableEquationBaseDescription];
  uint64_t v15 = [v13 componentsJoinedByString:@", "];
  return [v14 stringByAppendingString:v15];
}

- (uint64_t)_debuggableEquationDescriptionWithoutLegend
{
  uint64_t v2 = [a1 valueForKey:@"asciiArtDescription"];
  if (!v2)
  {
    uint64_t v2 = [a1 valueForKey:@"equationDescription"];
    if (!v2) {
      uint64_t v2 = [a1 description];
    }
  }
  v3 = (void *)[a1 _debuggableEquationBaseDescription];
  return [v3 stringByAppendingString:v2];
}

@end