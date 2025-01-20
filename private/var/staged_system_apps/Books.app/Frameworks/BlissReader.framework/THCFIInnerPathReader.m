@interface THCFIInnerPathReader
- (BOOL)updateWithCfiFrag:(id)a3 toIndex:(unint64_t)a4;
- (CGPoint)spatialOffsetTerminatingStep;
- (THCFIInnerPathReader)initWithInnerCfiFrag:(id)a3;
- (id)pathStringNoIds;
- (id)terminatingComponentIdentifier;
- (int)sideBiasOfTerminatingStep;
- (unint64_t)characterOffsetTerminatingStepIdentifier:(id *)a3;
- (unint64_t)componentAtIndex:(unint64_t)a3 identifier:(id *)a4;
- (unint64_t)componentCount;
- (unint64_t)temporalOffsetTerminatingStepInSeconds;
- (void)dealloc;
- (void)parseTerminatingStep;
@end

@implementation THCFIInnerPathReader

- (THCFIInnerPathReader)initWithInnerCfiFrag:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THCFIInnerPathReader;
  v4 = [(THCFIInnerPathReader *)&v7 init];
  v5 = (THCFIInnerPathReader *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 4) = 0;
    *(CGPoint *)(v4 + 24) = CGPointZero;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 56) = 0u;
    *((void *)v4 + 9) = 0;
    *((void *)v4 + 1) = [a3 componentsSeparatedByString:@"/"];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THCFIInnerPathReader;
  [(THCFIInnerPathReader *)&v3 dealloc];
}

- (unint64_t)characterOffsetTerminatingStepIdentifier:(id *)a3
{
  if (a3) {
    *a3 = self->mTerminatingCharOffsetIdentifier;
  }
  return self->mTerminatingCharacterOffset;
}

- (id)terminatingComponentIdentifier
{
  return self->mTerminatingComponentIdentifier;
}

- (unint64_t)temporalOffsetTerminatingStepInSeconds
{
  return self->mTerminatingTemporalOffset;
}

- (CGPoint)spatialOffsetTerminatingStep
{
  double x = self->mTerminatingSpacialOffset.x;
  double y = self->mTerminatingSpacialOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)sideBiasOfTerminatingStep
{
  return self->mTerminatingSideBias;
}

- (id)pathStringNoIds
{
  id v3 = +[NSMutableString string];
  unint64_t v4 = [(THCFIInnerPathReader *)self componentCount];
  if (v4)
  {
    unint64_t v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = v4 - 1;
    do
    {
      unint64_t v8 = [(THCFIInnerPathReader *)self componentAtIndex:v6 identifier:0];
      if (v8)
      {
        if (v6 >= v7) {
          CFStringRef v9 = @"%lu";
        }
        else {
          CFStringRef v9 = @"%lu/";
        }
        [v3 appendFormat:v9, v8];
      }
      ++v6;
    }
    while (v5 != v6);
  }
  return v3;
}

- (void)parseTerminatingStep
{
  mInsidePathComponents = self->mInsidePathComponents;
  self->mInsidePathComponents = (NSArray *)+[THCFIReader mergeBackArrayComponentsWithEscapeIn:mInsidePathComponents desiredMaxCount:0 separator:@"/"];

  id v4 = [(NSArray *)self->mInsidePathComponents lastObject];
  unint64_t v5 = (char *)[v4 length];
  if (v5)
  {
    unint64_t v6 = (unint64_t)v5;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    CFStringRef v9 = v5 - 1;
    uint64_t v10 = -1;
    uint64_t v11 = -1;
    do
    {
      uint64_t v12 = v7;
      int v13 = [v4 characterAtIndex:v8];
      if (v13 <= 90)
      {
        if (v13 != 58)
        {
          if (v13 != 59)
          {
            if (v13 == 64)
            {
              if (v10 != -1) {
                uint64_t v11 = v8;
              }
              char v14 = 1;
              uint64_t v7 = 4;
              goto LABEL_63;
            }
            goto LABEL_29;
          }
          if (v10 != -1) {
            uint64_t v11 = v8;
          }
          if (v7 == 6 || v7 == 1)
          {
            if (v6 < v8 + 3
              || [v4 characterAtIndex:v8 + 1] != 115
              || [v4 characterAtIndex:v8 + 2] != 61)
            {
              goto LABEL_61;
            }
            unsigned int v18 = [v4 characterAtIndex:v8 + 3];
            if (v18 == 98)
            {
              char v14 = 0;
              self->mTerminatingSideBias = -1;
LABEL_83:
              v8 += 3;
            }
            else
            {
              if (v18 == 97)
              {
                char v14 = 0;
                self->mTerminatingSideBias = 1;
                goto LABEL_83;
              }
LABEL_61:
              char v14 = 1;
            }
            uint64_t v12 = 6;
            goto LABEL_63;
          }
LABEL_57:
          char v14 = 1;
          goto LABEL_63;
        }
        uint64_t v15 = 5;
        if (v7 != 4) {
          uint64_t v15 = v7;
        }
        if (v7) {
          uint64_t v7 = v15;
        }
        else {
          uint64_t v7 = 3;
        }
        if (v10 != -1) {
          uint64_t v11 = v8;
        }
      }
      else
      {
        if (v13 > 93)
        {
          if (v13 == 126)
          {
            if (v10 != -1) {
              uint64_t v11 = v8;
            }
            char v14 = 1;
            uint64_t v7 = 2;
            goto LABEL_63;
          }
          if (v13 == 94)
          {
            ++v8;
          }
          else
          {
LABEL_29:
            if (v10 == -1) {
              uint64_t v10 = v8;
            }
          }
          goto LABEL_57;
        }
        if (v13 == 91)
        {
          if (v10 != -1) {
            uint64_t v11 = v8;
          }
          if (v7) {
            uint64_t v16 = v7;
          }
          else {
            uint64_t v16 = 1;
          }
          if (v7) {
            uint64_t v17 = v7;
          }
          else {
            uint64_t v17 = 0;
          }
          if (v7 == 3) {
            uint64_t v7 = 6;
          }
          else {
            uint64_t v7 = v16;
          }
          if (v12 != 3) {
            uint64_t v12 = v17;
          }
          char v14 = 1;
          goto LABEL_63;
        }
        if (v13 != 93) {
          goto LABEL_29;
        }
        if (v10 != -1) {
          uint64_t v11 = v8;
        }
        if (v7 == 1) {
          uint64_t v7 = 0;
        }
      }
      char v14 = 1;
LABEL_63:
      if (((v8 == (void)v9) & v14) != 0) {
        uint64_t v11 = v8 + 1;
      }
      if (v10 != -1 && v11 != -1)
      {
        id v19 = [v4 substringWithRange:v10, v11 - v10];
        v20 = v19;
        switch(v12)
        {
          case 0:
            self->mTerminatingComponent = (unint64_t)[v19 integerValue];
            break;
          case 1:
            if (self->mTerminatingCharOffsetIdentifier)
            {
              [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCFIInnerPathReader parseTerminatingStep]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/THCFIInnerPathReader.mm") lineNumber:245 description:@"%@", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"unexpected text found in terminating step parseLookingForComponentIdentifier: %@, curNum: %@", v4, v19)];
            }
            else
            {

              self->mTerminatingComponentIdentifier = (NSString *)v20;
            }
            break;
          case 2:
            self->mTerminatingTemporalOffset = (unint64_t)[v19 integerValue];
            break;
          case 3:
            self->mTerminatingCharacterOffset = (unint64_t)[v19 integerValue];
            break;
          case 4:
            [v19 doubleValue];
            self->mTerminatingSpacialOffset.double x = v21;
            break;
          case 5:
            [v19 doubleValue];
            self->mTerminatingSpacialOffset.double y = v22;
            break;
          case 6:
            if (self->mTerminatingCharOffsetIdentifier) {
              [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCFIInnerPathReader parseTerminatingStep]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/THCFIInnerPathReader.mm") lineNumber:230 description:@"%@", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"unexpected text found in terminating step parseLookingForSideBias: %@, curNum: %@", v4, v19)];
            }
            else {
              self->mTerminatingCharOffsetIdentifier = (NSString *)v19;
            }
            break;
          default:
            break;
        }
        uint64_t v11 = -1;
        uint64_t v10 = -1;
      }
      ++v8;
    }
    while (v8 < v6);
  }
}

- (BOOL)updateWithCfiFrag:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = +[THCFIReader mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:](THCFIReader, "mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:", [a3 componentsSeparatedByString:@"/"], 0, @"/");
  uint64_t v7 = (char *)[v6 count];
  NSUInteger v8 = [(NSArray *)self->mInsidePathComponents count];
  CFStringRef v9 = v7 - 1;
  id v10 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", v9), "componentsSeparatedByString:", @":");
  if ((unint64_t)[v10 count] < 2) {
    return 0;
  }
  [v6 replaceObjectAtIndex:v9 withObject:[v10 objectAtIndex:0]];
  if (objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 1), "integerValue"))
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCFIInnerPathReader updateWithCfiFrag:toIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/THCFIInnerPathReader.mm") lineNumber:276 description:@"if we don't have a CFI with no offset, we can't resolve the rest. returning NO."];
    return 0;
  }
  while (v8 != a4)
    [v6 addObject:[self->mInsidePathComponents objectAtIndex:a4++]];

  self->mInsidePathComponents = (NSArray *)v6;
  [(THCFIInnerPathReader *)self parseTerminatingStep];
  return 1;
}

- (unint64_t)componentAtIndex:(unint64_t)a3 identifier:(id *)a4
{
  if ((char *)[(NSArray *)self->mInsidePathComponents count] - 1 == (unsigned char *)a3)
  {
    if (a4) {
      *a4 = self->mTerminatingComponentIdentifier;
    }
    return self->mTerminatingComponent;
  }
  else
  {
    mInsidePathComponents = self->mInsidePathComponents;
    return +[THCFIReader componentOfArray:mInsidePathComponents atIndex:a3 identifier:a4];
  }
}

- (unint64_t)componentCount
{
  return [(NSArray *)self->mInsidePathComponents count];
}

@end