@interface BEAXLineInfo
+ (CGPoint)addOffsetForPoint:(CGPoint)a3;
+ (CGPoint)subtractOffsetForPoint:(CGPoint)a3;
+ (id)chapterLineInfosForElement:(id)a3;
+ (id)lineRectsForElement:(id)a3;
+ (id)linkElementsForElement:(id)a3;
+ (id)textForElement:(id)a3;
- (BAXObjectWrapper)objectWrapperElement;
- (BEAXLineInfo)initWithRange:(_NSRange)a3 frame:(CGRect)a4 attributedText:(id)a5 element:(id)a6;
- (CGPoint)frameCenterPoint;
- (CGRect)frameInScreenCoordinates;
- (NSAttributedString)attributedText;
- (_NSRange)rangeInChapter;
- (id)description;
@end

@implementation BEAXLineInfo

- (BEAXLineInfo)initWithRange:(_NSRange)a3 frame:(CGRect)a4 attributedText:(id)a5 element:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BEAXLineInfo;
  v17 = [(BEAXLineInfo *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_rangeInChapter.NSUInteger location = location;
    v17->_rangeInChapter.NSUInteger length = length;
    v17->_frameInScreenCoordinates.origin.CGFloat x = x;
    v17->_frameInScreenCoordinates.origin.CGFloat y = y;
    v17->_frameInScreenCoordinates.size.CGFloat width = width;
    v17->_frameInScreenCoordinates.size.CGFloat height = height;
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGFloat MidX = CGRectGetMidX(v23);
    CGFloat MidY = CGRectGetMidY(v18->_frameInScreenCoordinates);
    v18->_frameCenterPoint.CGFloat x = MidX;
    v18->_frameCenterPoint.CGFloat y = MidY;
    objc_storeStrong((id *)&v18->_attributedText, a5);
    objc_storeStrong((id *)&v18->_objectWrapperElement, a6);
  }

  return v18;
}

+ (CGPoint)addOffsetForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[BEAXWebContentUtilities offset];
  double v6 = x + v5;
  double v8 = y + v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

+ (CGPoint)subtractOffsetForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[BEAXWebContentUtilities offset];
  double v6 = x - v5;
  double v8 = y - v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

+ (id)chapterLineInfosForElement:(id)a3
{
  v3 = [a3 baxBookContentElement];
  v4 = v3;
  if (v3)
  {
    double v5 = [v3 baxStoredLineInfos];

    if (!v5)
    {
      id v9 = [v4 elementTextRange];
      double v6 = +[NSMutableArray array];
      sub_F240(v4, (NSUInteger *)&v9, v6);
      [v4 baxSetStoredLineInfos:v6];
    }
  }
  double v7 = [v4 baxStoredLineInfos];

  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v11.NSUInteger location = (NSUInteger)[(BEAXLineInfo *)self rangeInChapter];
  v4 = NSStringFromRange(v11);
  [(BEAXLineInfo *)self frameInScreenCoordinates];
  double v5 = NSStringFromRect(v12);
  double v6 = [(BEAXLineInfo *)self attributedText];
  double v7 = [v6 string];
  double v8 = +[NSString stringWithFormat:@"<%@ %p range=%@ frame=%@ text='%@'>", v3, self, v4, v5, v7];

  return v8;
}

+ (id)linkElementsForElement:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  double v5 = +[NSMutableArray array];
  if ((uint64_t)[v3 accessibilityElementCount] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      double v7 = [v3 accessibilityElementAtIndex:v6];
      [v5 addObject:v7];

      ++v6;
    }
    while (v6 < (uint64_t)[v3 accessibilityElementCount]);
  }
  if ([v5 count])
  {
    UIAccessibilityTraits v8 = UIAccessibilityTraitCausesPageTurn;
    UIAccessibilityTraits v9 = UIAccessibilityTraitLink;
    do
    {
      v10 = [v5 objectAtIndexedSubscript:0];
      unint64_t v11 = v8 | (unint64_t)[v10 accessibilityTraits];
      [v10 setAccessibilityTraits:v11];
      [v5 removeObjectAtIndex:0];
      if ((v9 & ~v11) != 0)
      {
        if ((uint64_t)[v10 accessibilityElementCount] >= 1)
        {
          NSRect v12 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v10 accessibilityElementCount]);
          v13 = +[NSMutableArray array];
          if ((uint64_t)[v10 accessibilityElementCount] >= 1)
          {
            uint64_t v14 = 0;
            do
            {
              id v15 = [v10 accessibilityElementAtIndex:v14];
              [v13 addObject:v15];

              ++v14;
            }
            while (v14 < (uint64_t)[v10 accessibilityElementCount]);
          }
          [v5 insertObjects:v13 atIndexes:v12];
        }
      }
      else
      {
        [v4 addObject:v10];
      }
    }
    while ([v5 count]);
  }
  id v16 = [v4 copy];

  return v16;
}

+ (id)lineRectsForElement:(id)a3
{
  id v3 = [a3 lineRectsAndText];
  if ([v3 count])
  {
    v4 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) valueForKey:@"rect" v13];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if ([v4 count]) {
      id v11 = v4;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)textForElement:(id)a3
{
  id v3 = a3;
  v4 = [v3 textMarkerRange];
  id v5 = [v3 stringForTextMarkers:v4];

  return v5;
}

- (_NSRange)rangeInChapter
{
  NSUInteger length = self->_rangeInChapter.length;
  NSUInteger location = self->_rangeInChapter.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CGRect)frameInScreenCoordinates
{
  double x = self->_frameInScreenCoordinates.origin.x;
  double y = self->_frameInScreenCoordinates.origin.y;
  double width = self->_frameInScreenCoordinates.size.width;
  double height = self->_frameInScreenCoordinates.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)frameCenterPoint
{
  double x = self->_frameCenterPoint.x;
  double y = self->_frameCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (BAXObjectWrapper)objectWrapperElement
{
  return self->_objectWrapperElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectWrapperElement, 0);

  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end