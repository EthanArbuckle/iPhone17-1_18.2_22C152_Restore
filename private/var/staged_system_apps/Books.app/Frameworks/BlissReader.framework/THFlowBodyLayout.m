@interface THFlowBodyLayout
- (BOOL)isLaidOut;
- (BOOL)usesInflation;
- (THFlowBodyLayout)layoutWithLayoutManager:(id)a3 range:(_NSRange)a4;
- (_NSRange)expandedRangeForLayoutRange:(_NSRange)a3 styleProvider:(id)a4;
- (double)textHeight;
- (id)nextTargetFirstChildHint;
- (id)nextTargetFirstColumn;
- (id)previousTargetLastColumn;
- (unsigned)autosizeFlags;
- (unsigned)bodyIndex;
- (void)setBodyIndex:(unsigned int)a3;
- (void)setTextHeight:(double)a3;
@end

@implementation THFlowBodyLayout

- (BOOL)isLaidOut
{
  return [(NSMutableArray *)[(THBodyLayout *)self columns] count] != 0;
}

- (THFlowBodyLayout)layoutWithLayoutManager:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  id location = (id)a4.location;
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowBodyLayout layoutWithLayoutManager:range:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowBodyLayout.mm"] lineNumber:42 description:@"invalid nil value for '%s'", "layoutManager"];
  }
  if (![(THFlowBodyLayout *)self info]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowBodyLayout layoutWithLayoutManager:range:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowBodyLayout.mm"] lineNumber:43 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "self.info"];
  }
  if (![(THFlowBodyLayout *)self isLaidOut]) {
    [(THBodyLayout *)self createColumns];
  }
  [a3 layoutIntoTarget:self withRange:location, length];
  double v9 = v8;
  if (location != [(THBodyLayout *)self columnRange] || length != v10) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowBodyLayout layoutWithLayoutManager:range:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowBodyLayout.mm"] lineNumber:51 description:@"body contains the wrong range"];
  }
  if (![(THFlowBodyLayout *)self isLaidOut]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowBodyLayout layoutWithLayoutManager:range:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowBodyLayout.mm") lineNumber:53 description:@"body should be laid out after laying out"];
  }
  float v11 = v9;
  [(THFlowBodyLayout *)self setTextHeight:ceilf(v11)];

  return (THFlowBodyLayout *)[(THBodyLayout *)self invalidateSize];
}

- (_NSRange)expandedRangeForLayoutRange:(_NSRange)a3 styleProvider:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [[self info] bodyStorage];
  v7 = v6;
  if (location) {
    uint64_t v8 = (uint64_t)[v6 paragraphIndexAtCharIndex:location - 1];
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    NSUInteger v9 = length;
    NSUInteger v10 = location + length;
    NSUInteger v11 = location;
  }
  else
  {
    unint64_t v12 = 0;
    while (1)
    {
      id v13 = [a4 paragraphStyleAtParIndex:v8 effectiveRange:v44];
      objc_opt_class();
      [v13 objectForProperty:109];
      uint64_t v14 = TSUDynamicCast();
      uint64_t v15 = v44[0];
      if (v14) {
        break;
      }
      if ([v7 characterAtIndex:v44[0]] != 65532
        || (objc_opt_class(), [v7 attachmentAtCharIndex:v15], (uint64_t v16 = TSUDynamicCast()) == 0)
        || (v17 = (void *)v16, objc_opt_class(), [v17 drawable], !TSUDynamicCast()))
      {
        if (v8) {
          --v8;
        }
        else {
          uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v12 <= 3)
        {
          ++v12;
          if (location - v15 < 0x800) {
            continue;
          }
        }
      }
      goto LABEL_5;
    }
    NSUInteger v10 = location + length;
    if (v44[0] <= location + length) {
      NSUInteger v18 = location + length;
    }
    else {
      NSUInteger v18 = v44[0];
    }
    if (v44[0] >= location + length) {
      NSUInteger v11 = location + length;
    }
    else {
      NSUInteger v11 = v44[0];
    }
    NSUInteger v9 = v18 - v11;
  }
  id v19 = [v7 length];
  if (v10)
  {
    unint64_t v20 = (unint64_t)v19;
    v21 = (char *)[v7 paragraphIndexAtCharIndex:v10 - 1];
    if (v21 != (char *)0x7FFFFFFFFFFFFFFFLL && v10 >= location)
    {
      v22 = v21;
      NSUInteger v41 = v11;
      NSUInteger v43 = v9;
      uint64_t v23 = 0;
      NSUInteger v24 = v10;
      while (1)
      {
        if (v24 < v20 && [v7 characterAtIndex:v24] == 65532)
        {
          objc_opt_class();
          [v7 attachmentAtCharIndex:v24];
          uint64_t v25 = TSUDynamicCast();
          if (v25)
          {
            v26 = (void *)v25;
            objc_opt_class();
            [v26 drawable];
            if (TSUDynamicCast()) {
              break;
            }
          }
        }
        id v27 = [a4 paragraphStyleAtParIndex:&v22[v23] effectiveRange:v44, v41];
        objc_opt_class();
        [v27 objectForProperty:109];
        uint64_t v28 = TSUDynamicCast();
        NSUInteger v24 = v44[0];
        if (v28)
        {
          if (v10 < v20)
          {
            v29 = (char *)[v7 paragraphIndexAtCharIndex:v10];
            if (v29 != (char *)0x7FFFFFFFFFFFFFFFLL && (unint64_t)-v23 <= 4 && v10 - v24 <= 0x7FF)
            {
              v30 = v29;
              uint64_t v31 = 0;
              uint64_t v32 = 0x7FFFFFFFFFFFFFFELL - (void)v29;
              uint64_t v33 = -v23;
              do
              {
                v44[0] = [v7 textRangeForParagraphAtIndex:&v30[v31]];
                v44[1] = v34;
                NSUInteger v10 = v44[0] + v34;
                if (v44[0] + v34 >= v20 || v32 == v31 || (unint64_t)(v33 + v31) > 3) {
                  break;
                }
                ++v31;
              }
              while (v10 - v24 < 0x800);
            }
          }
          NSUInteger v11 = v41;
          NSUInteger v37 = v43 + v41;
          if (v43 + v41 <= v10) {
            NSUInteger v37 = v10;
          }
          goto LABEL_52;
        }
        if (((unint64_t)&v22[v23] & 0x7FFFFFFFFFFFFFFFLL) != 0)
        {
          --v23;
          if (v44[0] >= location) {
            continue;
          }
        }
        NSUInteger v11 = v41;
        NSUInteger v9 = v43;
        goto LABEL_58;
      }
      NSUInteger v11 = v41;
      NSUInteger v37 = v43 + v41;
      if (v43 + v41 <= v24) {
        NSUInteger v37 = v24;
      }
LABEL_52:
      if (v11 <= v37) {
        NSUInteger v38 = v37;
      }
      else {
        NSUInteger v38 = v11;
      }
      if (v11 >= v37) {
        NSUInteger v11 = v37;
      }
      NSUInteger v9 = v38 - v11;
    }
  }
LABEL_58:
  NSUInteger v39 = v11;
  NSUInteger v40 = v9;
  result.NSUInteger length = v40;
  result.NSUInteger location = v39;
  return result;
}

- (BOOL)usesInflation
{
  return 0;
}

- (unsigned)autosizeFlags
{
  return 3;
}

- (id)previousTargetLastColumn
{
  return 0;
}

- (id)nextTargetFirstColumn
{
  return 0;
}

- (id)nextTargetFirstChildHint
{
  return 0;
}

- (double)textHeight
{
  return self->mTextHeight;
}

- (void)setTextHeight:(double)a3
{
  self->mTextHeight = a3;
}

- (unsigned)bodyIndex
{
  return self->mBodyIndex;
}

- (void)setBodyIndex:(unsigned int)a3
{
  self->mBodyIndex = a3;
}

@end