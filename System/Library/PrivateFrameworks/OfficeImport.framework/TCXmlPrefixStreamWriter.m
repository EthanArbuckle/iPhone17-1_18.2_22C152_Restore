@interface TCXmlPrefixStreamWriter
- (BOOL)addElement:(id)a3;
- (BOOL)startElement:(id)a3;
- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4;
- (BOOL)writeAttribute:(id)a3 content:(id)a4;
- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4;
- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5;
- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4;
- (BOOL)writeAttribute:(id)a3 unsignedLongContent:(unint64_t)a4;
- (BOOL)writeIndexAttribute:(id)a3 intContent:(unint64_t)a4;
- (BOOL)writeOAAttribute:(id)a3 BOOLContent:(BOOL)a4;
- (BOOL)writeOAAttribute:(id)a3 doubleContent:(double)a4;
- (BOOL)writeOAAttribute:(id)a3 enumContent:(int)a4 map:(id)a5;
- (BOOL)writeOAAttribute:(id)a3 intContent:(int64_t)a4;
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
- (TCXmlPrefixStreamWriter)initWithTextWriterProvider:(id)a3;
- (id)currentAttributePrefix;
- (id)currentElementPrefix;
- (id)currentState;
- (id)pushState;
- (id)pushStateWithElementPrefix:(id)a3 attributePrefix:(id)a4;
- (id)pushStateWithSharedPrefix:(id)a3;
- (void)dealloc;
- (void)popState;
- (void)pushElementPrefix:(id)a3 attributePrefix:(id)a4;
- (void)pushOAState;
- (void)writeTextString:(id)a3 forElement:(id)a4;
@end

@implementation TCXmlPrefixStreamWriter

- (TCXmlPrefixStreamWriter)initWithTextWriterProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCXmlPrefixStreamWriter;
  v5 = [(TCXmlStreamWriter *)&v10 initWithTextWriterProvider:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    mStateStack = v5->mStateStack;
    v5->mStateStack = (NSMutableArray *)v6;

    id v8 = [(TCXmlPrefixStreamWriter *)v5 pushStateWithElementPrefix:0 attributePrefix:0];
  }

  return v5;
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
  id v5 = +[OITSUPair pairWithFirst:a3 second:a4];
  -[NSMutableArray addObject:](mStateStack, "addObject:");
}

- (id)pushState
{
  objc_super v3 = objc_alloc_init(TCXmlPrefixStreamWriterState);
  [(NSMutableArray *)self->mStateStack addObject:v3];
  return v3;
}

- (id)pushStateWithElementPrefix:(id)a3 attributePrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TCXmlPrefixStreamWriter *)self pushState];
  [v8 setElementPrefix:v6];
  [v8 setAttributePrefix:v7];

  return v8;
}

- (id)pushStateWithSharedPrefix:(id)a3
{
  objc_super v3 = [(TCXmlPrefixStreamWriter *)self pushStateWithElementPrefix:a3 attributePrefix:a3];
  return v3;
}

- (void)popState
{
}

- (id)currentState
{
  return (id)[(NSMutableArray *)self->mStateStack lastObject];
}

- (id)currentElementPrefix
{
  v2 = [(TCXmlPrefixStreamWriter *)self currentState];
  objc_super v3 = [v2 elementPrefix];

  return v3;
}

- (id)currentAttributePrefix
{
  v2 = [(TCXmlPrefixStreamWriter *)self currentState];
  objc_super v3 = [v2 attributePrefix];

  return v3;
}

- (BOOL)startElement:(id)a3
{
  id v4 = a3;
  id v5 = [(TCXmlPrefixStreamWriter *)self currentElementPrefix];
  LOBYTE(self) = [(TCXmlStreamWriter *)self startElement:v4 prefix:v5 ns:0];

  return (char)self;
}

- (BOOL)addElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TCXmlPrefixStreamWriter *)self startElement:v4]
    && [(TCXmlStreamWriter *)self endElement];

  return v5;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TCXmlPrefixStreamWriter *)self currentAttributePrefix];
  LOBYTE(self) = [(TCXmlStreamWriter *)self writeAttribute:v6 content:v7 prefix:v8 ns:0];

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = TCXmlStringForBool(v4);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeAttribute:v6 content:v7];

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4
{
  id v6 = a3;
  id v7 = TCXmlStringForInt(a4);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeAttribute:v6 content:v7];

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 unsignedLongContent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = TCXmlStringForUnsignedLong(a4);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeAttribute:v6 content:v7];

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = TCXmlStringForEnum(v6, (TCEnumerationMap *)a5);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeAttribute:v8 content:v9];

  return (char)self;
}

- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4
{
  id v6 = a3;
  id v7 = TCXmlStringForDouble(a4);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeAttribute:v6 content:v7];

  return (char)self;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 content:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(TCXmlPrefixStreamWriter *)self startElement:v8]) {
    goto LABEL_6;
  }
  if (v10 && ![(TCXmlPrefixStreamWriter *)self writeAttribute:v9 content:v10])
  {
    [(TCXmlStreamWriter *)self endElement];
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_7;
  }
  BOOL v11 = [(TCXmlStreamWriter *)self endElement];
LABEL_7:

  return v11;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 BOOLContent:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = TCXmlStringForBool(v5);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:v8 attributeName:v9 content:v10];

  return (char)self;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 intContent:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = TCXmlStringForInt(a5);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:v8 attributeName:v9 content:v10];

  return (char)self;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 enumContent:(int)a5 map:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v12 = TCXmlStringForEnum(v7, (TCEnumerationMap *)a6);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:v10 attributeName:v11 content:v12];

  return (char)self;
}

- (BOOL)writeOneAttributeElementWithName:(id)a3 attributeName:(id)a4 doubleContent:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = TCXmlStringForDouble(a5);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeOneAttributeElementWithName:v8 attributeName:v9 content:v10];

  return (char)self;
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

- (void).cxx_destruct
{
}

- (void)pushOAState
{
  id v2 = [(TCXmlPrefixStreamWriter *)self pushStateWithElementPrefix:@"a" attributePrefix:0];
}

- (BOOL)writeOAAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = TCXmlStringForBool(v4);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeOAAttribute:v6 content:v7];

  return (char)self;
}

- (BOOL)writeOAAttribute:(id)a3 intContent:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = TCXmlStringForInt(a4);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeOAAttribute:v6 content:v7];

  return (char)self;
}

- (BOOL)writeOAAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = TCXmlStringForEnum(v6, (TCEnumerationMap *)a5);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeOAAttribute:v8 content:v9];

  return (char)self;
}

- (BOOL)writeOAAttribute:(id)a3 doubleContent:(double)a4
{
  id v6 = a3;
  uint64_t v7 = TCXmlStringForDouble(a4);
  LOBYTE(self) = [(TCXmlPrefixStreamWriter *)self writeOAAttribute:v6 content:v7];

  return (char)self;
}

- (BOOL)writeIndexAttribute:(id)a3 intContent:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = a4 != 0xFFFFFFFF
    && [(TCXmlPrefixStreamWriter *)self writeAttribute:v6 intContent:a4];

  return v7;
}

- (void)writeTextString:(id)a3 forElement:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(TCXmlPrefixStreamWriter *)self startElement:v6];
  if (([v7 hasPrefix:@" "] & 1) != 0
    || ([v7 hasSuffix:@" "] & 1) != 0
    || ([v7 hasPrefix:@"\n"] & 1) != 0
    || ([v7 hasSuffix:@"\n"] & 1) != 0
    || ([v7 hasPrefix:@"\t"] & 1) != 0
    || [v7 hasSuffix:@"\t"])
  {
    [(TCXmlStreamWriter *)self writeAttribute:@"space" content:@"preserve" prefix:@"xml" ns:0];
  }
  [(TCXmlStreamWriter *)self writeString:v7];
  [(TCXmlStreamWriter *)self endElement];
}

@end