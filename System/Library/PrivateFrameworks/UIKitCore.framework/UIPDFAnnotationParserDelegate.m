@interface UIPDFAnnotationParserDelegate
- (BOOL)parseError;
- (UIPDFAnnotation)annotation;
- (UIPDFAnnotationParserDelegate)init;
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)setAnnotation:(id)a3;
@end

@implementation UIPDFAnnotationParserDelegate

- (UIPDFAnnotationParserDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFAnnotationParserDelegate;
  result = [(UIPDFAnnotationParserDelegate *)&v3 init];
  if (result) {
    result->_parseError = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)UIPDFAnnotationParserDelegate;
  [(UIPDFAnnotationParserDelegate *)&v2 dealloc];
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  self->_parseError = 1;
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  characters = self->_characters;
  if (characters) {
    [(NSMutableString *)characters appendString:a4];
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:@"UIPDFAnnotation"])
  {
    v10 = (void *)[a7 valueForKey:@"type"];
    if ([v10 isEqualToString:@"UIPDFAnnotationTypeCircle"])
    {
      v11 = off_1E52D4298;
    }
    else if ([v10 isEqualToString:@"UIPDFAnnotationTypeFreeText"])
    {
      v11 = off_1E52D42A8;
    }
    else if ([v10 isEqualToString:@"UIPDFAnnotationTypeHighlight"])
    {
      v11 = off_1E52D42B0;
    }
    else if ([v10 isEqualToString:@"UIPDFAnnotationTypeLine"])
    {
      v11 = off_1E52D42B8;
    }
    else if ([v10 isEqualToString:@"UIPDFAnnotationTypeStamp"])
    {
      v11 = off_1E52D4300;
    }
    else if ([v10 isEqualToString:@"UIPDFAnnotationTypeStrikeOut"])
    {
      v11 = off_1E52D4308;
    }
    else if ([v10 isEqualToString:@"UIPDFAnnotationTypeText"])
    {
      v11 = off_1E52D4310;
    }
    else if ([v10 isEqualToString:@"UIPDFAnnotationTypeUnderline"])
    {
      v11 = off_1E52D4318;
    }
    else
    {
      if (![v10 isEqualToString:@"UIPDFAnnotationTypePopup"])
      {
        v23 = 0;
        goto LABEL_33;
      }
      v11 = off_1E52D42E8;
    }
    v23 = (UIPDFAnnotation *)objc_alloc_init(*v11);
LABEL_33:
    self->_annotation = v23;
    return;
  }
  if ([a4 isEqualToString:@"ID"]) {
    goto LABEL_15;
  }
  if (![a4 isEqualToString:@"Color"])
  {
    if (![a4 isEqualToString:@"Contents"]
      && ![a4 isEqualToString:@"Tag"]
      && ![a4 isEqualToString:@"Index"]
      && ![a4 isEqualToString:@"PopupID"]
      && ![a4 isEqualToString:@"ParentID"])
    {
      return;
    }
LABEL_15:
    self->_characters = (NSMutableString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
    return;
  }
  v12 = (void *)[a7 valueForKey:@"R"];
  v13 = (void *)[a7 valueForKey:@"G"];
  v14 = (void *)[a7 valueForKey:@"B"];
  v15 = (void *)[a7 valueForKey:@"A"];
  [v12 floatValue];
  components[0] = v16;
  [v13 floatValue];
  components[1] = v17;
  [v14 floatValue];
  components[2] = v18;
  if (v15)
  {
    [v15 floatValue];
    double v20 = v19;
  }
  else
  {
    double v20 = 1.0;
  }
  components[3] = v20;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v22 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  [(UIPDFAnnotation *)self->_annotation setColor:v22];
  CGColorRelease(v22);
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ([a4 isEqualToString:@"ID"])
  {
    [(UIPDFAnnotation *)self->_annotation setAnnotationID:self->_characters];
  }
  else if ([a4 isEqualToString:@"Contents"])
  {
    [(UIPDFAnnotation *)self->_annotation setContents:self->_characters];
  }
  else if ([a4 isEqualToString:@"PopupID"] {
         || [a4 isEqualToString:@"ParentID"])
  }
  {
    [(UIPDFAnnotation *)self->_annotation setAssociatedAnnotationID:self->_characters];
  }
  else if ([a4 isEqualToString:@"Tag"])
  {
    [(UIPDFAnnotation *)self->_annotation setTag:[(NSMutableString *)self->_characters integerValue]];
  }
  else if ([a4 isEqualToString:@"Index"])
  {
    [(UIPDFAnnotation *)self->_annotation setIndex:[(NSMutableString *)self->_characters integerValue]];
  }

  self->_characters = 0;
}

- (UIPDFAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (BOOL)parseError
{
  return self->_parseError;
}

@end