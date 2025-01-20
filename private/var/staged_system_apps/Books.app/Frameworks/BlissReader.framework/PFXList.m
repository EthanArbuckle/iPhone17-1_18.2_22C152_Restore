@interface PFXList
+ (double)labelIndentWithState:(id)a3;
+ (double)textIndentWithOrientationState:(id)a3;
+ (id)bulletColorFromPropertySet:(id)a3;
+ (id)bulletGeometryListType:(int)a3 bullet:(id)a4 entryOrientationState:(id)a5 propertySet:(id)a6;
+ (id)listTypeFromCssListStyleType:(id)a3;
+ (id)newBulletListPropertyNames:(id)a3;
+ (void)mapBulletWithOrientationState:(id)a3 readerState:(id)a4;
+ (void)mapNonListStyleWithOrientationState:(id)a3 readerState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (int64_t)mapStartIndexWithStackEntry:(id)a3;
- (void)mapCurrentBreakStateForOrientation:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXList

- (void)mapCurrentBreakStateForOrientation:(id)a3
{
}

- (int64_t)mapStartIndexWithStackEntry:(id)a3
{
  if (!qword_573778)
  {
    objc_sync_enter(self);
    if (!qword_573778)
    {
      v5 = [[PFSPair alloc] initWithType:264 value:@"item"];
      __dmb(0xBu);
      qword_573778 = (uint64_t)v5;
    }
    objc_sync_exit(self);
  }
  id v6 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet"), "valueForProperty:", "counter-reset");
  if ([v6 count] != (char *)&dword_0 + 2) {
    return 0;
  }
  id v7 = [v6 objectAtIndex:0];
  if (![v7 isEqual:qword_573778]) {
    return 0;
  }
  id v8 = +[PFXStyleUtilities numberStringInPair:](PFXStyleUtilities, "numberStringInPair:", [v6 objectAtIndex:1]);
  int64_t result = (int64_t)[v8 length];
  if (result) {
    return (int64_t)[v8 integerValue];
  }
  return result;
}

+ (id)listTypeFromCssListStyleType:(id)a3
{
  id v4 = (id)qword_573780;
  if (!qword_573780)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [v4 setObject:[NSNumber numberWithInteger:0] forKey:@"decimal"];
    [v4 setObject:[NSNumber numberWithInteger:9] forKey:@"upper-alpha"];
    [v4 setObject:[NSNumber numberWithInteger:12] forKey:@"lower-alpha"];
    [v4 setObject:[NSNumber numberWithInteger:3] forKey:@"upper-roman"];
    [v4 setObject:[NSNumber numberWithInteger:6] forKey:@"lower-roman"];
    [v4 setObject:[NSNumber numberWithInteger:0] forKey:@"decimal-leading-zero"];
    qword_573780 = (uint64_t)v4;
  }

  return [v4 objectForKey:a3];
}

+ (id)bulletGeometryListType:(int)a3 bullet:(id)a4 entryOrientationState:(id)a5 propertySet:(id)a6
{
  [a5 fontSize:a3 a4];
  double v10 = v9;
  id v11 = [a5 characterStyle];
  if ([v11 definesProperty:33])
  {
    [v11 floatValueForProperty:33];
    double v13 = v12;
  }
  else
  {
    id v14 = [a6 valueForProperty:PFXPropNmApplePubBulletBaseline[0]];
    double v13 = 0.0;
    if (v14)
    {
      v15 = v14;
      if ([v14 count])
      {
        +[PFSUtilities fontPointSizeFromHtmlStr:parentSize:](PFSUtilities, "fontPointSizeFromHtmlStr:parentSize:", [v15 objectAtIndex:0], 0.0);
        if (v16 != -65536.0) {
          double v13 = v16;
        }
      }
    }
  }
  if ([v11 definesProperty:17])
  {
    [v11 floatValueForProperty:17];
    double v18 = v17;
    if (v10 == v18) {
      double v19 = 1.0;
    }
    else {
      double v19 = v18 / v10;
    }
    if (a3 != 1) {
      goto LABEL_32;
    }
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    double v19 = 1.0;
LABEL_15:
    objc_opt_class();
    [a6 valueForProperty:PFXPropNmApplePubBulletScale[0]];
    v20 = (void *)TSUDynamicCast();
    double v21 = 1.0;
    if ([v20 count] == (char *)&dword_0 + 1)
    {
      objc_opt_class();
      [v20 objectAtIndex:0];
      v22 = (void *)TSUDynamicCast();
      if (v22)
      {
        v23 = v22;
        if ([v22 type] == &stru_108.addr)
        {
          objc_opt_class();
          [v23 value];
          [(id)TSUDynamicCast() doubleValue];
          double v21 = v24;
        }
        else if ([v23 type] == &stru_108.segname[15])
        {
          objc_opt_class();
          [v23 value];
          [(id)TSUDynamicCast() doubleValue];
          double v21 = v28 / 100.0;
        }
      }
    }
    if (v21 != 0.0) {
      double v19 = v21;
    }
    goto LABEL_32;
  }
  id v25 = [a6 valueForProperty:"font-size"];
  if (v25 && (v26 = v25, [v25 count]))
  {
    +[PFSUtilities fontPointSizeFromHtmlStr:parentSize:](PFSUtilities, "fontPointSizeFromHtmlStr:parentSize:", [v26 objectAtIndex:0], v10);
    if (v27 == -65536.0) {
      double v27 = v10;
    }
  }
  else
  {
    double v27 = v10;
  }
  if (v27 == v10) {
    double v19 = 1.0;
  }
  else {
    double v19 = v27 / v10;
  }
LABEL_32:
  id v29 = [objc_alloc((Class)TSWPListLabelGeometry) initWithScale:0 scaleWithText:v19 baselineOffset:v13];

  return v29;
}

+ (void)mapNonListStyleWithOrientationState:(id)a3 readerState:(id)a4
{
  id v7 = [a3 stylesheet];
  id v8 = objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "defaultNoneListStyle");
  [a1 textIndentWithOrientationState:a3];
  if (v9 != 0.0)
  {
    double v10 = v9;
    id v12 = [objc_alloc((Class)NSMutableArray) initWithArray:[v8 valueForProperty:176]];
    [v12 replaceObjectAtIndex:0 withObject:[NSNumber numberWithDouble:v10]];
    id v11 = objc_alloc_init((Class)TSSPropertyMap);
    [v11 setObject:v12 forProperty:176];
    [a3 setListStyle:[v7 variationOfStyle:v8 propertyMap:v11]];
  }
}

+ (id)newBulletListPropertyNames:(id)a3
{
  v9[0] = PFXPropNmApplePubBulletFontFamily[0];
  v9[1] = PFXPropNmApplePubBulletColor[0];
  v9[2] = PFXPropNmApplePubBulletFontVariant[0];
  v9[3] = PFXPropNmApplePubBulletFontSize[0];
  v9[4] = PFXPropNmApplePubBulletFontWeight[0];
  v9[5] = PFXPropNmApplePubBulletFontStyle[0];
  v8[0] = "font-family";
  v8[1] = "color";
  v8[2] = "font-variant";
  v8[3] = "font-size";
  v8[4] = "font-weight";
  v8[5] = "font-style";
  id v4 = objc_alloc_init(PFSPropertySet);
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v6 = [a3 valueForProperty:v9[i]];
    if (v6) {
      [(PFSPropertySet *)v4 addPropertyValue:v6 forProperty:v8[i]];
    }
  }
  return v4;
}

+ (void)mapBulletWithOrientationState:(id)a3 readerState:(id)a4
{
  id v7 = [a3 propertySet];
  id v8 = [a4 currentHtmlDocMediaState];
  unsigned __int8 v9 = [v8 orderedList];
  double v10 = +[NSNull null];
  v47 = v8;
  id v48 = v7;
  if (v9)
  {
    id v11 = [v7 valueForProperty:"list-style-type"];
    if (v11)
    {
      id v12 = v11;
      if ([v11 count])
      {
        id v13 = [v12 objectAtIndex:0];
        if ([v13 type] == &stru_108)
        {
          id v14 = [a1 listTypeFromCssListStyleType:[v13 value]];
          if (v14)
          {
            v15 = v14;
            id v16 = a1;
            id v17 = objc_msgSend(objc_msgSend(v7, "valueForProperty:", PFXPropNmApplePubListNumericFormat[0]), "lastObject");
            if ([v17 type] == &stru_108)
            {
              id v18 = [v17 value];
              if ([v18 isEqual:PFXPropValApplePubDoubleParen])
              {
                double v19 = (char *)[(NSNull *)v15 integerValue] + 1;
LABEL_30:
                double v10 = +[NSNumber numberWithInteger:v19];
                char v42 = 0;
                uint64_t v23 = 3;
LABEL_32:
                a1 = v16;
                goto LABEL_19;
              }
              if ([v18 isEqual:PFXPropValApplePubRightParen])
              {
                double v19 = (char *)[(NSNull *)v15 integerValue] + 2;
                goto LABEL_30;
              }
            }
            char v42 = 0;
            uint64_t v23 = 3;
            double v10 = v15;
            goto LABEL_32;
          }
        }
      }
    }
    goto LABEL_18;
  }
  id v20 = [v7 valueForProperty:PFXPropNmApplePubCustomBullet[0]];
  if (v20 && (double v21 = v20, [v20 count]))
  {
    id v22 = [v21 objectAtIndex:0];
    if ((char *)[v22 type] - 263 <= (unsigned char *)&dword_0 + 1) {
      double v10 = (NSNull *)[v22 value];
    }
    char v42 = 0;
    uint64_t v23 = 2;
  }
  else
  {
    id v24 = [v7 valueForProperty:"list-style-image"];
    if (!v24
      || (id v25 = v24, ![v24 count])
      || (id v26 = [v25 objectAtIndex:0], objc_msgSend(v26, "type") != (char *)&stru_108.addr + 1))
    {
LABEL_18:
      char v42 = 0;
      uint64_t v23 = 0;
      goto LABEL_19;
    }
    double v10 = (NSNull *)objc_msgSend(a4, "imageDataForUri:", objc_msgSend(objc_msgSend(v26, "value"), "stringWithURLFromCssUriValue"));
    char v42 = 1;
    uint64_t v23 = 1;
  }
LABEL_19:
  id v45 = [a3 stylesheet];
  id v46 = a4;
  id v27 = objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "defaultNoneListStyle");
  id v43 = [objc_alloc((Class)NSMutableArray) initWithArray:[v27 valueForProperty:177]];
  id v44 = v27;
  id v28 = [objc_alloc((Class)NSMutableArray) initWithArray:[v27 valueForProperty:176]];
  id v29 = objc_alloc_init((Class)NSMutableArray);
  id v49 = objc_alloc_init((Class)NSMutableArray);
  id v30 = a1;
  id v31 = a3;
  id v32 = [a1 bulletGeometryListType:v23 bullet:v10 entryOrientationState:a3 propertySet:v48];
  id v33 = +[NSMutableArray array];
  uint64_t v34 = 9;
  do
  {
    [v49 addObject:v10];
    [v29 addObject:v32];
    [v33 addObject:[NSNumber numberWithInt:v23]];
    --v34;
  }
  while (v34);
  id v35 = objc_alloc_init((Class)TSSPropertyMap);
  [v35 setObject:v33 forProperty:180];
  [v30 labelIndentWithState:v46];
  double v37 = v36;
  v38 = v31;
  [v30 textIndentWithOrientationState:v31];
  double v40 = v39;
  if ((v42 & 1) == 0)
  {
    id v41 = [v30 newBulletListPropertyNames:v48];
    v38 = v31;
    +[PFXFont mapFontProperties:to:stackEntry:](PFXFont, "mapFontProperties:to:stackEntry:", v41, v35, [v46 currentHtmlStackEntry]);
  }
  [v43 replaceObjectAtIndex:[v47 listLevel] withObject:[NSNumber numberWithDouble:v37]];
  [v28 replaceObjectAtIndex:[v47 listLevel] withObject:[NSNumber numberWithDouble:v40]];
  [v35 setObject:v43 forProperty:177];
  [v35 setObject:v28 forProperty:176];
  [v35 setObject:v29 forProperty:181];
  if ((v23 - 1) <= 2) {
    [v35 setObject:v49 forProperty:(v23 + 181)];
  }
  [v38 setListStyle:[v45 variationOfStyle:v44 propertyMap:v35]];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [a3 currentHtmlDocMediaState];
  id v7 = [v5 currentEntryMediaState];
  int64_t v8 = [(PFXList *)self mapStartIndexWithStackEntry:v5];
  [(PFXList *)self mapCurrentBreakStateForOrientation:v7];
  [v6 setListStart:v8];
  objc_msgSend(v6, "startListOrdered:", xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlElementName"), (const xmlChar *)"ol") != 0);
  if ([v6 hasHints])
  {
    if (([a3 inTable] & 1) == 0)
    {
      id v9 = [a3 totalTextRead];
      if (v9 == [v6 nextHintLocation] && !objc_msgSend(v6, "nextHintShapeRef"))
      {
        objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v7, "storage")), "addLineBreakHintWithPresentationId:", @"p");
        [v6 popHint];
      }
    }
  }
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = [a3 currentHtmlDocMediaState];
  id v5 = [a3 currentHtmlStackEntry];
  [v4 stopList];
  id v6 = [v5 currentEntryMediaState];
  [v6 setParentBreakStateSameAsCurrent];

  [v6 setListStyle:0];
}

+ (double)labelIndentWithState:(id)a3
{
  id v4 = [a3 currentHtmlStackEntry];
  id v5 = [v4 parentEntry];
  id v6 = [v4 currentEntryMediaState];
  id v7 = [a3 currentHtmlDocMediaState];
  [v6 parentFontSize];
  double v9 = v8;
  [v6 blockWidth];
  double v18 = -65536.0;
  +[PFSMargins mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:](PFSMargins, "mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:", objc_msgSend(objc_msgSend(v5, "currentEntryMediaState", 0xC0F0000000000000, 0xC0F0000000000000, 0xC0F0000000000000), "propertySet"), +[PFXMargins paddingPropertyNames](PFXMargins, "paddingPropertyNames"), &v18, &v17, &v15, &v16, v9, v10);
  double v11 = v18;
  if (v18 == -65536.0) {
    double v11 = 0.0;
  }
  double v18 = v11;
  if ((uint64_t)[v7 listLevel] <= 0)
  {
    double v13 = v18;
  }
  else
  {
    [v7 listIndentForLevel:[v7 listLevel] - 1];
    double v13 = v12 + v18;
    double v18 = v12 + v18;
  }
  [v7 setListIndent:[v7 listLevel] forLevel:v13];
  return v18;
}

+ (double)textIndentWithOrientationState:(id)a3
{
  id v4 = [a3 propertySet];
  id v5 = [v4 valueForProperty:PFXPropNmApplePubListTextIndent[0]];
  double v6 = 0.0;
  if (v5)
  {
    id v7 = v5;
    if ([v5 count])
    {
      id v8 = [v7 objectAtIndex:0];
      char v14 = 0;
      [a3 fontSize];
      +[PFSUtilities htmlValueToPointLength:parentFontSize:isPercent:](PFSUtilities, "htmlValueToPointLength:parentFontSize:isPercent:", v8, &v14);
      double v10 = v9;
      if (v14)
      {
        [a3 blockWidth];
        double v10 = v10 * v11;
      }
      [a3 fontSize];
      return v10 / v12;
    }
  }
  return v6;
}

+ (id)bulletColorFromPropertySet:(id)a3
{
  id v3 = [a3 valueForProperty:"color"];
  id result = [v3 count];
  if (result)
  {
    id v5 = [v3 objectAtIndex:0];
    return +[PFXStyleUtilities htmlPairToColor:v5];
  }
  return result;
}

@end