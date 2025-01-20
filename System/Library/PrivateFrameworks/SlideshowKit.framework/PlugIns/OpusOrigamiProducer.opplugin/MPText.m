@interface MPText
+ (MPText)textWithAttributedString:(id)a3;
- (BOOL)isOriginal;
- (MPText)init;
- (MPText)initWithAttributedString:(id)a3;
- (double)displayDuration;
- (double)displayStartTime;
- (double)displayTime;
- (double)maxFontSize;
- (double)textAreaAspectRatio;
- (id)action;
- (id)attributedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultString;
- (id)description;
- (id)fullDebugLog;
- (id)nearestPlug;
- (id)parentEffect;
- (id)plainString;
- (id)subtitleSlide;
- (id)text;
- (int64_t)index;
- (void)checkForMaxFontSize;
- (void)checkForPlacesLabel;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)setAttributedString:(id)a3;
- (void)setParent:(id)a3;
- (void)setPlainString:(id)a3;
- (void)setText:(id)a3;
@end

@implementation MPText

+ (MPText)textWithAttributedString:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithAttributedString:a3];
  return (MPText *)v3;
}

- (MPText)initWithAttributedString:(id)a3
{
  v4 = [(MPText *)self init];
  v5 = v4;
  if (v4) {
    [(MPTextInternal *)v4->_internal setAttributedString:a3];
  }
  return v5;
}

- (MPText)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPText;
  v2 = [(MPText *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPTextInternal);
    v2->_internal = v3;
    [(MPTextInternal *)v3 setAttributedString:0];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  return v4;
}

- (id)description
{
  return [+[NSString stringWithFormat:@"============================== Text %d Description =============================\n", [(MPText *)self index]] stringByAppendingFormat:@"\t                        String: %@\n", [(MPText *)self attributedString]];
}

- (void)dealloc
{
  text = self->_text;
  if (text)
  {

    self->_text = 0;
  }

  self->_internal = 0;
  v4.receiver = self;
  v4.super_class = (Class)MPText;
  [(MPText *)&v4 dealloc];
}

- (id)attributedString
{
  return [(MPTextInternal *)self->_internal attributedString];
}

- (void)setAttributedString:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToAttributedString:", -[MPTextInternal attributedString](self->_internal, "attributedString")) & 1) == 0)
  {
    if ([(MPText *)self parentEffect])
    {
      unsigned int v5 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "useUppercaseForEffectID:presetID:forTextAtIndex:", objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectID"), objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "presetID"), -[MPText index](self, "index"));
      unsigned __int8 v6 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "allowTextCustomizationForEffectID:presetID:forTextAtIndex:", objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectID"), objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "presetID"), -[MPText index](self, "index"));
    }
    else
    {
      unsigned int v5 = 0;
      unsigned __int8 v6 = 1;
    }
    id v7 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:a3];
    v8 = v7;
    if (v5) {
      objc_msgSend(v7, "replaceCharactersInRange:withString:", 0, objc_msgSend(v7, "length"), objc_msgSend(objc_msgSend(v7, "string"), "uppercaseString"));
    }
    if ((v6 & 1) == 0)
    {
      id v9 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", -[MPText defaultString](self, "defaultString"));
      objc_msgSend(v9, "replaceCharactersInRange:withString:", 0, objc_msgSend(v9, "length"), objc_msgSend(v8, "string"));

      v8 = v9;
    }
    [(MPTextInternal *)self->_internal setAttributedString:v8];

    [(MPText *)self checkForMaxFontSize];
    [(MPText *)self checkForPlacesLabel];
    if (self->_text)
    {
      v10 = [(MPTextInternal *)self->_internal attributedString];
      text = self->_text;
      [(MCText *)text setAttributedString:v10];
    }
  }
}

- (id)parentEffect
{
  return self->_parent;
}

- (id)subtitleSlide
{
  id v2 = objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "parentContainer");
  id v3 = [v2 parentLayer];
  objc_super v4 = (char *)objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "subtitleOrderForStyleID:", objc_msgSend(objc_msgSend(v3, "parentDocument"), "styleID"));
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = objc_msgSend(objc_msgSend(v3, "objectInEffectContainersAtIndex:", (char *)objc_msgSend(v2, "index") + 1), "effects");
    id result = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (result)
    {
      id v11 = result;
      uint64_t v12 = *(void *)v24;
LABEL_14:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
        if ((uint64_t)[v14 countOfSlides] >= 1)
        {
          id result = objc_msgSend(objc_msgSend(v14, "slides"), "objectAtIndex:", 0);
          if (result) {
            break;
          }
        }
        if (v11 == (id)++v13)
        {
          id v11 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
          id result = 0;
          if (v11) {
            goto LABEL_14;
          }
          return result;
        }
      }
    }
  }
  else if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = objc_msgSend(objc_msgSend(v3, "objectInEffectContainersAtIndex:", (char *)objc_msgSend(v2, "index") - 1), "effects", 0);
    id result = [v15 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (result)
    {
      id v16 = result;
      uint64_t v17 = *(void *)v20;
LABEL_24:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        id result = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18), "slides"), "lastObject");
        if (result) {
          break;
        }
        if (v16 == (id)++v18)
        {
          id v16 = [v15 countByEnumeratingWithState:&v19 objects:v31 count:16];
          id result = 0;
          if (v16) {
            goto LABEL_24;
          }
          return result;
        }
      }
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = [v2 effects];
    id result = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (result)
    {
      id v7 = result;
      uint64_t v8 = *(void *)v28;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        id result = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v9), "slides"), "lastObject");
        if (result) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
          id result = 0;
          if (v7) {
            goto LABEL_5;
          }
          return result;
        }
      }
    }
  }
  return result;
}

- (int64_t)index
{
  parent = self->_parent;
  if (!parent) {
    return -1;
  }
  if (self->_text)
  {
    text = self->_text;
    return [(MCText *)text index];
  }
  else
  {
    id v6 = [(MPEffectSupport *)parent texts];
    return (int64_t)[v6 indexOfObject:self];
  }
}

- (double)displayTime
{
  double v3 = 0.0;
  if (objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectID"), "isEqualToString:", @"PinMap"))
  {
    NSRange v4 = NSRangeFromString((NSString *)objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinRange"));
    id v5 = objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinInformation"), "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v4.location, v4.length));
    if (!([(MPText *)self index] | v4.location))
    {
      objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "phaseInDuration");
      double v7 = v6;
      double v8 = 2.3;
      return v7 + v8;
    }
    if ([(MPText *)self index] >= 1)
    {
      objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"startTime"), "doubleValue");
      double v10 = v9;
      objc_msgSend(objc_msgSend(objc_msgSend(v5, "objectAtIndex:", (char *)-[MPText index](self, "index") - 1), "objectForKey:", @"pinStart"), "doubleValue");
      double v7 = v11 - v10 + -2.35;
      objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "phaseInDuration");
      return v7 + v8;
    }
  }
  return v3;
}

- (double)displayStartTime
{
  double v3 = 0.0;
  if (objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectID"), "isEqualToString:", @"PinMap"))
  {
    NSRange v4 = NSRangeFromString((NSString *)objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinRange"));
    id v5 = objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinInformation"), "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v4.location, v4.length));
    if (!([(MPText *)self index] | v4.location))
    {
      objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "phaseInDuration");
      double v7 = v6;
      double v8 = 0.25;
      return v7 + v8;
    }
    if ([(MPText *)self index] >= 1)
    {
      objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"startTime"), "doubleValue");
      double v10 = v9;
      objc_msgSend(objc_msgSend(objc_msgSend(v5, "objectAtIndex:", (char *)-[MPText index](self, "index") - 1), "objectForKey:", @"pinStart"), "doubleValue");
      double v7 = v11 - v10 + -2.35;
      objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "phaseInDuration");
      return v7 + v8;
    }
  }
  return v3;
}

- (double)displayDuration
{
  if (!objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectID"), "isEqualToString:", @"PinMap"))return 0.0; {
  NSUInteger location = NSRangeFromString((NSString *)objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinRange")).location;
  }
  int64_t v4 = [(MPText *)self index];
  double result = 3.75;
  if (v4 | location)
  {
    uint64_t v6 = [(MPText *)self index];
    double result = 2.75;
    if (v6 <= 0) {
      return 0.0;
    }
  }
  return result;
}

- (double)textAreaAspectRatio
{
  id v2 = [(MPText *)self parentEffect];
  if (v2)
  {
    id v3 = v2;
    double v4 = 1.0;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v4;
      }
      if ([v3 conformsToProtocol:&OBJC_PROTOCOL___MPGeometrySupport])
      {
        [v3 size];
        double v6 = v5;
        [v3 size];
        double v4 = v4 * (v6 / v7);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v3 = [v3 parentContainer];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v3 parentLayer];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_16;
              }
            }
          }
        }
        id v8 = [v3 parent];
      }
      id v3 = v8;
LABEL_16:
      if (!v3) {
        return v4;
      }
    }
  }
  return 1.0;
}

- (id)text
{
  return self->_text;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  return +[NSString stringWithFormat:@"\n%@\n", [(MPText *)self description]];
}

- (id)defaultString
{
  id v3 = [(MPText *)self parentEffect];
  id v4 = +[MPEffectManager sharedManager];
  id v5 = [v3 effectID];
  id v6 = [v3 presetID];
  int64_t v7 = [(MPText *)self index];
  return [v4 defaultStringForTextInEffectID:v5 presetID:v6 atIndex:v7];
}

- (double)maxFontSize
{
  id v3 = [(MPText *)self parentEffect];
  id v4 = +[MPEffectManager sharedManager];
  id v5 = [v3 effectID];
  id v6 = [v3 presetID];
  int64_t v7 = [(MPText *)self index];
  [v4 maxFontSizeInEffectID:v5 presetID:v6 atIndex:v7];
  return result;
}

- (BOOL)isOriginal
{
  id v3 = [(MPEffectSupport *)self->_parent parentDocument];
  if (v3)
  {
    id v4 = v3;
    LODWORD(v3) = objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectID"), "isEqualToString:", @"PinMap");
    if (v3)
    {
      id v5 = [v4 authoringOptionForKey:kMPAuthoringPlaceLabels];
      NSRange v6 = NSRangeFromString((NSString *)objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinRange"));
      id v7 = objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinInformation");
      id v8 = objc_msgSend(v7, "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v6.location, v6.length));
      if ([(MPText *)self index] | v6.location)
      {
        if ([(MPText *)self index] < 1)
        {
LABEL_33:
          LOBYTE(v3) = 0;
          return (char)v3;
        }
        id v18 = objc_msgSend(objc_msgSend(v8, "objectAtIndex:", (char *)-[MPText index](self, "index") - 1), "objectForKey:", @"photos");
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v32;
          LOBYTE(v22) = 1;
LABEL_24:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            id v24 = objc_msgSend(objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v31 + 1) + 8 * v23)), "objectForKey:", @"pinLabel");
            unsigned int v25 = objc_msgSend(v24, "isEqualToAttributedString:", -[MPText attributedString](self, "attributedString"));
            if (v25) {
              break;
            }
            int v22 = (v24 == 0) & v22;
            if (v20 == (id)++v23)
            {
              unsigned int v26 = v25;
              id v20 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
              if (v20) {
                goto LABEL_24;
              }
              if (((v26 | v22) & 1) == 0) {
                goto LABEL_33;
              }
              break;
            }
          }
        }
      }
      else
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v30 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v30)
        {
          uint64_t v9 = *(void *)v40;
          char v10 = 1;
          uint64_t v28 = *(void *)v40;
          long long v29 = v7;
          while (2)
          {
            for (i = 0; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v40 != v9) {
                objc_enumerationMutation(v7);
              }
              id v12 = [*(id *)(*((void *)&v39 + 1) + 8 * i) objectForKey:@"photos"];
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              id v13 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
              if (v13)
              {
                id v14 = v13;
                uint64_t v15 = *(void *)v36;
LABEL_11:
                uint64_t v16 = 0;
                while (1)
                {
                  if (*(void *)v36 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  id v17 = objc_msgSend(objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v35 + 1) + 8 * v16)), "objectForKey:", @"mapLabel");
                  if (objc_msgSend(v17, "isEqualToAttributedString:", -[MPText attributedString](self, "attributedString")))goto LABEL_31; {
                  v10 &= v17 == 0;
                  }
                  if (v14 == (id)++v16)
                  {
                    id v14 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
                    if (v14) {
                      goto LABEL_11;
                    }
                    break;
                  }
                }
              }
              id v7 = v29;
              uint64_t v9 = v28;
            }
            id v30 = [v29 countByEnumeratingWithState:&v39 objects:v45 count:16];
            if (v30) {
              continue;
            }
            break;
          }
          if ((v10 & 1) == 0) {
            goto LABEL_33;
          }
        }
      }
LABEL_31:
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (id)plainString
{
  id v2 = [(MCText *)self->_text attributedString];
  return [(NSAttributedString *)v2 string];
}

- (void)setPlainString:(id)a3
{
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", -[MPText attributedString](self, "attributedString"));
  objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, objc_msgSend(v5, "length"), a3);
  [(MPText *)self setAttributedString:v5];
}

- (id)action
{
  id v3 = objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "container");
  id v4 = +[NSString stringWithFormat:@"text%d", [(MPText *)self index]];
  return [v3 actionForKey:v4];
}

- (void)copyStruct:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "attributedString"), "copy");
  internal = self->_internal;
  [(MPTextInternal *)internal setAttributedString:v4];
}

- (id)nearestPlug
{
  id v2 = [(MPText *)self parentEffect];
  return [v2 nearestPlug];
}

- (void)setText:(id)a3
{
  text = self->_text;
  if (text)
  {

    self->_text = 0;
  }
  NSRange v6 = (MCText *)a3;
  self->_text = v6;
  if (v6)
  {
    id v7 = [(MPTextInternal *)self->_internal attributedString];
    id v8 = self->_text;
    [(MCText *)v8 setAttributedString:v7];
  }
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A text may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parent = (MPEffectSupport *)a3;
  [(MPText *)self checkForMaxFontSize];
}

- (void)checkForPlacesLabel
{
  id v3 = [(MPEffectSupport *)self->_parent parentDocument];
  if (v3)
  {
    id v4 = v3;
    if (objc_msgSend(objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectID"), "isEqualToString:", @"PinMap"))
    {
      id v24 = v4;
      id v5 = objc_msgSend(objc_msgSend(v4, "authoringOptionForKey:", kMPAuthoringPlaceLabels), "mutableCopy");
      if (!v5) {
        id v5 = objc_alloc_init((Class)NSMutableDictionary);
      }
      NSRange v6 = NSRangeFromString((NSString *)objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinRange"));
      id v7 = objc_msgSend(-[MPText parentEffect](self, "parentEffect"), "effectAttributeForKey:", @"pinInformation");
      id v8 = objc_msgSend(v7, "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v6.location, v6.length));
      if ([(MPText *)self index] | v6.location)
      {
        if ([(MPText *)self index] >= 1)
        {
          id v17 = objc_msgSend(objc_msgSend(v8, "objectAtIndex:", (char *)-[MPText index](self, "index") - 1), "objectForKey:", @"photos");
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v18 = [v17 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v30;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                id v23 = objc_msgSend(objc_msgSend(v5, "objectForKey:", v22), "mutableCopy");
                if (!v23) {
                  id v23 = objc_alloc_init((Class)NSMutableDictionary);
                }
                objc_msgSend(v23, "setObject:forKey:", -[MPText attributedString](self, "attributedString"), @"pinLabel");
                [v5 setObject:v23 forKey:v22];
              }
              id v19 = [v17 countByEnumeratingWithState:&v29 objects:v41 count:16];
            }
            while (v19);
          }
        }
      }
      else
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id obj = v7;
        id v27 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v27)
        {
          uint64_t v26 = *(void *)v38;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v38 != v26) {
                objc_enumerationMutation(obj);
              }
              uint64_t v28 = v9;
              id v10 = [*(id *)(*((void *)&v37 + 1) + 8 * v9) objectForKey:@"photos"];
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v11 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
              if (v11)
              {
                id v12 = v11;
                uint64_t v13 = *(void *)v34;
                do
                {
                  for (j = 0; j != v12; j = (char *)j + 1)
                  {
                    if (*(void *)v34 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
                    id v16 = objc_msgSend(objc_msgSend(v5, "objectForKey:", v15), "mutableCopy");
                    if (!v16) {
                      id v16 = objc_alloc_init((Class)NSMutableDictionary);
                    }
                    objc_msgSend(v16, "setObject:forKey:", -[MPText attributedString](self, "attributedString"), @"mapLabel");
                    [v5 setObject:v16 forKey:v15];
                  }
                  id v12 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
                }
                while (v12);
              }
              uint64_t v9 = v28 + 1;
            }
            while ((id)(v28 + 1) != v27);
            id v27 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
          }
          while (v27);
        }
      }
      [v24 setAuthoringOption:v5 forKey:kMPAuthoringPlaceLabels];
    }
  }
}

- (void)checkForMaxFontSize
{
  if (self->_parent)
  {
    if ([(MPTextInternal *)self->_internal attributedString])
    {
      objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "maxFontSizeInEffectID:presetID:atIndex:", -[MPEffectSupport effectID](self->_parent, "effectID"), -[MPEffectSupport presetID](self->_parent, "presetID"), -[MPText index](self, "index"));
      if (v3 >= 0.0)
      {
        CGFloat v4 = v3;
        id v5 = [(NSAttributedString *)[(MPTextInternal *)self->_internal attributedString] mutableCopy];
        id v6 = [v5 length];
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        if ((uint64_t)v6 >= 1)
        {
          uint64_t v7 = (uint64_t)v6;
          uint64_t v8 = 0;
          char v9 = 0;
          do
          {
            id v10 = (const __CTFont *)[v5 attribute:kCTFontAttributeName atIndex:v8 effectiveRange:&v13];
            if (CTFontGetSize(v10) > v4)
            {
              CFStringRef v11 = CTFontCopyPostScriptName(v10);
              CTFontRef v12 = CTFontCreateWithName(v11, v4, 0);
              CFRelease(v11);
              if (v12)
              {
                objc_msgSend(v5, "addAttribute:value:range:", kCTFontAttributeName, v12, v13, v14);
                CFRelease(v12);
              }
              char v9 = 1;
            }
            v8 += v14;
          }
          while (v8 < v7);
          if (v9) {
            [(MPTextInternal *)self->_internal setAttributedString:v5];
          }
        }
      }
    }
  }
}

@end