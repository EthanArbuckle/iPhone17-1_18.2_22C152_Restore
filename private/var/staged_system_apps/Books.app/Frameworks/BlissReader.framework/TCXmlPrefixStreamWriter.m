@interface TCXmlPrefixStreamWriter
+ (_xmlTextWriter)createNonXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5;
+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5;
- (BOOL)addElement:(id)a3;
- (BOOL)startElement:(id)a3;
- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4;
- (BOOL)writeAttribute:(id)a3 content:(id)a4;
- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4;
- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5;
- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4;
- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 BOOLContent:(BOOL)a5;
- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 content:(id)a5;
- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 doubleContent:(double)a5;
- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 enumContent:(int)a5 map:(id)a6;
- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 intContent:(int64_t)a5;
- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 BOOLContent:(BOOL)a4;
- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 content:(id)a4;
- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 doubleContent:(double)a4;
- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 enumContent:(int)a4 map:(id)a5;
- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 intContent:(int64_t)a4;
- (TCXmlPrefixStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3;
- (id)currentAttributePrefix;
- (id)currentElementPrefix;
- (id)currentState;
- (id)pushState;
- (id)pushStateWithElementPrefix:(id)a3 attributePrefix:(id)a4;
- (id)pushStateWithSharedPrefix:(id)a3;
- (void)dealloc;
- (void)popState;
- (void)pushElementPrefix:(id)a3 attributePrefix:(id)a4;
@end

@implementation TCXmlPrefixStreamWriter

- (TCXmlPrefixStreamWriter)initWithTextWriter:(_xmlTextWriter *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TCXmlPrefixStreamWriter;
  v3 = [(TCXmlStreamWriter *)&v5 initWithTextWriter:a3];
  if (v3)
  {
    v3->mStateStack = (NSMutableArray *)objc_opt_new();
    [(TCXmlPrefixStreamWriter *)v3 pushStateWithElementPrefix:0 attributePrefix:0];
  }
  return v3;
}

- (void)dealloc
{
  [(TCXmlPrefixStreamWriter *)self popState];

  v3.receiver = self;
  v3.super_class = (Class)TCXmlPrefixStreamWriter;
  [(TCXmlStreamWriter *)&v3 dealloc];
}

- (void)pushElementPrefix:(id)a3 attributePrefix:(id)a4
{
  mStateStack = self->mStateStack;
  objc_super v5 = +[TSUPair pairWithFirst:a3 second:a4];

  [(NSMutableArray *)mStateStack addObject:v5];
}

- (id)pushState
{
  objc_super v3 = objc_alloc_init(TCXmlPrefixStreamWriterState);
  [(NSMutableArray *)self->mStateStack addObject:v3];

  return v3;
}

- (id)pushStateWithElementPrefix:(id)a3 attributePrefix:(id)a4
{
  id v6 = [(TCXmlPrefixStreamWriter *)self pushState];
  [v6 setElementPrefix:a3];
  [v6 setAttributePrefix:a4];
  return v6;
}

- (id)pushStateWithSharedPrefix:(id)a3
{
  return [(TCXmlPrefixStreamWriter *)self pushStateWithElementPrefix:a3 attributePrefix:a3];
}

- (void)popState
{
}

- (id)currentState
{
  return [(NSMutableArray *)self->mStateStack lastObject];
}

- (id)currentElementPrefix
{
  id v2 = [(TCXmlPrefixStreamWriter *)self currentState];

  return [v2 elementPrefix];
}

- (id)currentAttributePrefix
{
  id v2 = [(TCXmlPrefixStreamWriter *)self currentState];

  return [v2 attributePrefix];
}

- (BOOL)startElement:(id)a3
{
  id v5 = [(TCXmlPrefixStreamWriter *)self currentElementPrefix];

  return [(TCXmlStreamWriter *)self startElement:a3 prefix:v5 ns:0];
}

- (BOOL)addElement:(id)a3
{
  BOOL v4 = [(TCXmlPrefixStreamWriter *)self startElement:a3];
  if (v4)
  {
    LOBYTE(v4) = [(TCXmlStreamWriter *)self endElement];
  }
  return v4;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4
{
  id v7 = [(TCXmlPrefixStreamWriter *)self currentAttributePrefix];

  return [(TCXmlStreamWriter *)self writeAttribute:a3 content:a4 prefix:v7 ns:0];
}

- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  CFStringRef v6 = TCXmlStringForBool(a4);

  return [(TCXmlPrefixStreamWriter *)self writeAttribute:a3 content:v6];
}

- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4
{
  CFStringRef v6 = TCXmlStringForInt(a4);

  return [(TCXmlPrefixStreamWriter *)self writeAttribute:a3 content:v6];
}

- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  id v7 = TCXmlStringForEnum(*(uint64_t *)&a4, a5);

  return [(TCXmlPrefixStreamWriter *)self writeAttribute:a3 content:v7];
}

- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4
{
  CFStringRef v6 = TCXmlStringForDouble(a4);

  return [(TCXmlPrefixStreamWriter *)self writeAttribute:a3 content:v6];
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 content:(id)a5
{
  if (![(TCXmlPrefixStreamWriter *)self startElement:a3]) {
    return 0;
  }
  if (a5 && ![(TCXmlPrefixStreamWriter *)self writeAttribute:a4 content:a5])
  {
    [(TCXmlStreamWriter *)self endElement];
    return 0;
  }

  return [(TCXmlStreamWriter *)self endElement];
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 BOOLContent:(BOOL)a5
{
  CFStringRef v8 = TCXmlStringForBool(a5);

  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:a4 content:v8];
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 intContent:(int64_t)a5
{
  CFStringRef v8 = TCXmlStringForInt(a5);

  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:a4 content:v8];
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 enumContent:(int)a5 map:(id)a6
{
  id v9 = TCXmlStringForEnum(*(uint64_t *)&a5, a6);

  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:a4 content:v9];
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 doubleContent:(double)a5
{
  CFStringRef v8 = TCXmlStringForDouble(a5);

  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:a4 content:v8];
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 content:(id)a4
{
  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:@"val" content:a4];
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 BOOLContent:(BOOL)a4
{
  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:@"val" BOOLContent:a4];
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 intContent:(int64_t)a4
{
  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:@"val" intContent:a4];
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 enumContent:(int)a4 map:(id)a5
{
  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:@"val" enumContent:*(void *)&a4 map:a5];
}

- (BOOL)writeValAttributeOnlyElementWithName:(id)a3 doubleContent:(double)a4
{
  return [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:a3 attributeName:@"val" doubleContent:a4];
}

+ (_xmlTextWriter)createXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TCXmlPrefixStreamWriter;
  return (xmlTextWriter *)[super createXmlTextWriterAtEntry:a3 inOutputStream:a4 isCompressed:a5];
}

+ (_xmlTextWriter)createNonXmlTextWriterAtEntry:(id)a3 inOutputStream:(id)a4 isCompressed:(BOOL)a5
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TCXmlPrefixStreamWriter;
  return (_xmlTextWriter *)[super createXmlTextWriterAtEntry:a3 inOutputStream:a4 isCompressed:a5];
}

@end