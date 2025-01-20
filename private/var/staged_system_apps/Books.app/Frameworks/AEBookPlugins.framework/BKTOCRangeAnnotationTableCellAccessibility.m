@interface BKTOCRangeAnnotationTableCellAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)aeHighlightStyleName;
- (id)aeHighlightedTextLabel;
@end

@implementation BKTOCRangeAnnotationTableCellAccessibility

+ (id)imaxTargetClassName
{
  return @"BKTOCRangeAnnotationTableCell";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(BKTOCRangeAnnotationTableCellAccessibility *)self aeHighlightedTextLabel];
  v4 = [v3 accessibilityLabel];

  v5 = [(BKTOCRangeAnnotationTableCellAccessibility *)self aeHighlightStyleName];
  if ([v5 length])
  {
    v10.receiver = self;
    v10.super_class = (Class)BKTOCRangeAnnotationTableCellAccessibility;
    v6 = [(BKTOCRangeAnnotationTableCellAccessibility *)&v10 accessibilityLabel];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BKTOCRangeAnnotationTableCellAccessibility;
    v6 = [(BKTOCRangeAnnotationTableCellAccessibility *)&v9 accessibilityLabel];
  }
  v7 = __IMAccessibilityStringForVariables();

  return v7;
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(BKTOCRangeAnnotationTableCellAccessibility *)self aeHighlightedTextLabel];
  v5 = [v4 accessibilityLabel];

  if ([v5 length]) {
    [v3 addObject:v5];
  }
  char v11 = 0;
  objc_opt_class();
  v6 = __IMAccessibilityCastAsSafeCategory();
  v7 = [v6 bkaxNoteLabelText];

  if ([v7 length]) {
    [v3 addObject:v7];
  }
  v10.receiver = self;
  v10.super_class = (Class)BKTOCRangeAnnotationTableCellAccessibility;
  v8 = [(BKTOCRangeAnnotationTableCellAccessibility *)&v10 accessibilityUserInputLabels];
  if (v8) {
    [v3 addObjectsFromArray:v8];
  }

  return v3;
}

- (id)accessibilityCustomContent
{
  id v3 = objc_opt_new();
  id v4 = objc_alloc((Class)NSMutableAttributedString);
  v5 = [(BKTOCRangeAnnotationTableCellAccessibility *)self aeHighlightedTextLabel];
  v6 = [v5 annotationAttributedString];
  id v7 = [v4 initWithAttributedString:v6];

  if ([v7 length])
  {
    [v7 addAttributes:&off_1E9588 range:0, [v7 length]];
    id v8 = [v7 length];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_F8848;
    v15[3] = &unk_1DDCC8;
    id v9 = v7;
    id v16 = v9;
    [v9 enumerateAttributesInRange:0 options:v8 usingBlock:v15];
    id v10 = objc_alloc((Class)NSAttributedString);
    char v11 = AEAXLocString(@"highlight.context.custom.content.name");
    id v12 = [v10 initWithString:v11];

    v13 = +[AXCustomContent customContentWithAttributedLabel:v12 attributedValue:v9];
    [v3 addObject:v13];
  }

  return v3;
}

- (id)aeHighlightedTextLabel
{
  objc_opt_class();
  id v3 = [(BKTOCRangeAnnotationTableCellAccessibility *)self imaxValueForKey:@"highlightedTextLabel"];
  id v4 = __IMAccessibilityCastAsClass();

  return v4;
}

- (id)aeHighlightStyleName
{
  objc_opt_class();
  id v3 = [(BKTOCRangeAnnotationTableCellAccessibility *)self aeHighlightedTextLabel];
  id v4 = [v3 annotation];
  v5 = __IMAccessibilityCastAsSafeCategory();

  v6 = [v5 imaxWholeAnnotationDescription];

  return v6;
}

@end