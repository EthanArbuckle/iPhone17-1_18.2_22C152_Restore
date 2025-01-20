@interface TCXmlStreamWriter
+ (BOOL)endElementInStream:(_xmlTextWriter *)a3;
+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4 prefix:(id)a5 ns:(const char *)a6;
+ (BOOL)startPlainElementInStream:(_xmlTextWriter *)a3 name:(id)a4;
+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4;
+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5 prefix:(id)a6 ns:(const char *)a7;
+ (BOOL)writeDtdToStream:(_xmlTextWriter *)a3 name:(id)a4 pubid:(id)a5 sysid:(id)a6 subset:(id)a7;
+ (BOOL)writeNamespaceToStream:(_xmlTextWriter *)a3 prefix:(id)a4 uri:(const char *)a5;
+ (BOOL)writePlainAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5;
+ (BOOL)writeStringToStream:(_xmlTextWriter *)a3 text:(id)a4;
+ (id)newXmlStreamWriterWithZipEntryName:(id)a3 outputStream:(id)a4 isCompressed:(BOOL)a5;
+ (void)resetElementIds;
- (BOOL)contentAddedToTopElement;
- (BOOL)endElement;
- (BOOL)endElementsToDepth:(unsigned int)a3;
- (BOOL)isWriting;
- (BOOL)setUp;
- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5;
- (BOOL)startPlainElement:(id)a3;
- (BOOL)tearDown;
- (BOOL)writeAnchorTarget:(id)a3;
- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5 prefix:(id)a6 ns:(const char *)a7;
- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4 prefix:(id)a5 ns:(const char *)a6;
- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6;
- (BOOL)writeElementId:(id)a3;
- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4;
- (BOOL)writePlainAttribute:(id)a3 BOOLContent:(BOOL)a4;
- (BOOL)writePlainAttribute:(id)a3 content:(id)a4;
- (BOOL)writePlainAttribute:(id)a3 doubleContent:(double)a4;
- (BOOL)writePlainAttribute:(id)a3 enumContent:(int)a4 map:(id)a5;
- (BOOL)writePlainAttribute:(id)a3 intContent:(int64_t)a4;
- (BOOL)writeString:(id)a3;
- (TCXmlStreamWriter)initWithTextWriterProvider:(id)a3;
- (_xmlTextWriter)textWriter;
- (id)textWriterProvider;
- (unsigned)currentDepth;
- (void)dealloc;
@end

@implementation TCXmlStreamWriter

- (TCXmlStreamWriter)initWithTextWriterProvider:(id)a3
{
  id v5 = a3;
  v6 = [(TCXmlStreamWriter *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mTextWriterProvider, a3);
    v7->mCurrentDepth = 0;
    v7->mContentAddedToTopElement = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mAddedIds = v7->mAddedIds;
    v7->mAddedIds = v8;
  }
  return v7;
}

- (void)dealloc
{
  [(TCXmlStreamWriter *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)TCXmlStreamWriter;
  [(TCXmlStreamWriter *)&v3 dealloc];
}

- (BOOL)isWriting
{
  return [(TCXmlStreamWriter *)self textWriter] != 0;
}

- (BOOL)setUp
{
  if ([(TCXmlStreamWriter *)self isWriting]) {
    return 1;
  }
  v4 = [(TCXmlStreamWriter *)self textWriterProvider];
  int v5 = [v4 setUp];

  return v5 && xmlTextWriterStartDocument([(TCXmlStreamWriter *)self textWriter], 0, "UTF-8", 0) >= 0;
}

- (BOOL)tearDown
{
  BOOL v3 = [(TCXmlStreamWriter *)self isWriting];
  if (v3)
  {
    [(TCXmlStreamWriter *)self endElementsToDepth:0];
    xmlTextWriterEndDocument([(TCXmlStreamWriter *)self textWriter]);
    xmlTextWriterFlush([(TCXmlStreamWriter *)self textWriter]);
    v4 = [(TCXmlStreamWriter *)self textWriterProvider];
    [v4 tearDown];
  }
  return v3;
}

+ (id)newXmlStreamWriterWithZipEntryName:(id)a3 outputStream:(id)a4 isCompressed:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [[TCZipEntryTextWriterProvider alloc] initWithEntryName:v7 outputStream:v8 isCompressed:v5];
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTextWriterProvider:v9];

  return v10;
}

+ (void)resetElementIds
{
  elementIdCount = 0;
}

- (id)textWriterProvider
{
  return self->mTextWriterProvider;
}

- (_xmlTextWriter)textWriter
{
  return [(TCXmlTextWriterProvider *)self->mTextWriterProvider textWriter];
}

- (BOOL)contentAddedToTopElement
{
  return self->mContentAddedToTopElement;
}

- (BOOL)startElement:(id)a3 prefix:(id)a4 ns:(const char *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = objc_msgSend((id)objc_opt_class(), "startElementInStream:name:prefix:ns:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v8, v9, a5);
  if (v10)
  {
    self->mContentAddedToTopElement = 0;
    ++self->mCurrentDepth;
  }

  return v10;
}

- (BOOL)startPlainElement:(id)a3
{
  return [(TCXmlStreamWriter *)self startElement:a3 prefix:0 ns:0];
}

- (BOOL)endElement
{
  if (self->mCurrentDepth)
  {
    int v3 = objc_msgSend((id)objc_opt_class(), "endElementInStream:", -[TCXmlStreamWriter textWriter](self, "textWriter"));
    if (v3)
    {
      --self->mCurrentDepth;
      LOBYTE(v3) = 1;
      self->mContentAddedToTopElement = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)writeString:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  BOOL v6 = self->mContentAddedToTopElement || [v4 length] != 0;
  self->mContentAddedToTopElement = v6;
  char v7 = objc_msgSend((id)objc_opt_class(), "writeStringToStream:text:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v5);

  return v7;
}

- (unsigned)currentDepth
{
  return self->mCurrentDepth;
}

- (BOOL)endElementsToDepth:(unsigned int)a3
{
  do
    unsigned int mCurrentDepth = self->mCurrentDepth;
  while (mCurrentDepth > a3 && [(TCXmlStreamWriter *)self endElement]);
  return mCurrentDepth <= a3;
}

- (BOOL)writeAttribute:(id)a3 content:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  id v10 = a3;
  v11 = (__CFString *)a4;
  id v12 = a5;
  if (v11) {
    v13 = v11;
  }
  else {
    v13 = &stru_26EBF24D8;
  }
  if (self->mCurrentDepth) {
    char v14 = objc_msgSend((id)objc_opt_class(), "writeAttributeToStream:name:content:prefix:ns:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v10, v13, v12, a6);
  }
  else {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)writeAttribute:(id)a3 intContent:(int64_t)a4 prefix:(id)a5 ns:(const char *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = TCXmlStringForInt(a4);
  LOBYTE(a6) = [(TCXmlStreamWriter *)self writeAttribute:v10 content:v12 prefix:v11 ns:a6];

  return (char)a6;
}

- (BOOL)writeAttribute:(id)a3 BOOLContent:(BOOL)a4 prefix:(id)a5 ns:(const char *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = TCXmlStringForBool(v8);
  LOBYTE(a6) = [(TCXmlStreamWriter *)self writeAttribute:v10 content:v12 prefix:v11 ns:a6];

  return (char)a6;
}

- (BOOL)writeAttribute:(id)a3 enumContent:(int)a4 map:(id)a5 prefix:(id)a6 ns:(const char *)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a6;
  char v14 = TCXmlStringForEnum(v10, (TCEnumerationMap *)a5);
  LOBYTE(a7) = [(TCXmlStreamWriter *)self writeAttribute:v12 content:v14 prefix:v13 ns:a7];

  return (char)a7;
}

- (BOOL)writeAttribute:(id)a3 doubleContent:(double)a4 prefix:(id)a5 ns:(const char *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = TCXmlStringForDouble(a4);
  LOBYTE(a6) = [(TCXmlStreamWriter *)self writeAttribute:v10 content:v12 prefix:v11 ns:a6];

  return (char)a6;
}

- (BOOL)writePlainAttribute:(id)a3 content:(id)a4
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 content:a4 prefix:0 ns:0];
}

- (BOOL)writePlainAttribute:(id)a3 intContent:(int64_t)a4
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 intContent:a4 prefix:0 ns:0];
}

- (BOOL)writePlainAttribute:(id)a3 BOOLContent:(BOOL)a4
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 BOOLContent:a4 prefix:0 ns:0];
}

- (BOOL)writePlainAttribute:(id)a3 enumContent:(int)a4 map:(id)a5
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 enumContent:*(void *)&a4 map:a5 prefix:0 ns:0];
}

- (BOOL)writePlainAttribute:(id)a3 doubleContent:(double)a4
{
  return [(TCXmlStreamWriter *)self writeAttribute:a3 doubleContent:0 prefix:0 ns:a4];
}

- (BOOL)writeElementId:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"b%d", ++elementIdCount);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v5 = [(TCXmlStreamWriter *)self writePlainAttribute:@"id" content:v4];

  return v5;
}

- (BOOL)writeNamespace:(id)a3 uri:(const char *)a4
{
  id v6 = a3;
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "writeNamespaceToStream:prefix:uri:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v6, a4);

  return (char)a4;
}

- (BOOL)writeDtd:(id)a3 pubid:(id)a4 sysid:(id)a5 subset:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "writeDtdToStream:name:pubid:sysid:subset:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v10, v11, v12, v13);

  return (char)self;
}

- (BOOL)writeAnchorTarget:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "writeAnchorTargetToStream:name:", -[TCXmlStreamWriter textWriter](self, "textWriter"), v4);

  return (char)self;
}

+ (BOOL)startPlainElementInStream:(_xmlTextWriter *)a3 name:(id)a4
{
  id v5 = a4;
  LOBYTE(a3) = [(id)objc_opt_class() startElementInStream:a3 name:v5 prefix:0 ns:0];

  return (char)a3;
}

+ (BOOL)startElementInStream:(_xmlTextWriter *)a3 name:(id)a4 prefix:(id)a5 ns:(const char *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (const xmlChar *)[v10 UTF8String];
  id v12 = v9;
  LODWORD(a6) = xmlTextWriterStartElementNS(a3, v11, (const xmlChar *)[v12 UTF8String], (const xmlChar *)a6);

  return (int)a6 >= 0;
}

+ (BOOL)endElementInStream:(_xmlTextWriter *)a3
{
  return xmlTextWriterEndElement(a3) >= 0;
}

+ (BOOL)writeStringToStream:(_xmlTextWriter *)a3 text:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(v5, "tc_stringByRemovingInvalidXmlChars");

  id v7 = v6;
  LODWORD(a3) = xmlTextWriterWriteString(a3, (const xmlChar *)[v7 UTF8String]);

  return (int)a3 >= 0;
}

+ (BOOL)writePlainAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(v8, "tc_stringByRemovingInvalidXmlChars");

  id v10 = v7;
  id v11 = (const xmlChar *)[v10 UTF8String];
  id v12 = v9;
  LODWORD(a3) = xmlTextWriterWriteAttribute(a3, v11, (const xmlChar *)[v12 UTF8String]);

  return (int)a3 >= 0;
}

+ (BOOL)writeAttributeToStream:(_xmlTextWriter *)a3 name:(id)a4 content:(id)a5 prefix:(id)a6 ns:(const char *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = objc_msgSend(v12, "tc_stringByRemovingInvalidXmlChars");

  id v15 = v13;
  v16 = (const xmlChar *)[v15 UTF8String];
  id v17 = v11;
  v18 = (const xmlChar *)[v17 UTF8String];
  id v19 = v14;
  LODWORD(a7) = xmlTextWriterWriteAttributeNS(a3, v16, v18, (const xmlChar *)a7, (const xmlChar *)[v19 UTF8String]);

  return (int)a7 >= 0;
}

+ (BOOL)writeNamespaceToStream:(_xmlTextWriter *)a3 prefix:(id)a4 uri:(const char *)a5
{
  id v7 = a4;
  if (v7) {
    id v8 = (__CFString *)[[NSString alloc] initWithFormat:@"xmlns:%@", v7];
  }
  else {
    id v8 = @"xmlns";
  }
  id v9 = v8;
  int v10 = xmlTextWriterWriteAttribute(a3, (const xmlChar *)[(__CFString *)v9 UTF8String], (const xmlChar *)a5);

  return v10 >= 0;
}

+ (BOOL)writeDtdToStream:(_xmlTextWriter *)a3 name:(id)a4 pubid:(id)a5 sysid:(id)a6 subset:(id)a7
{
  id v11 = a4;
  id v23 = a5;
  id v12 = a6;
  id v13 = a7;
  id v22 = v11;
  xmlTextWriterSetIndent(a3, 1);
  id v14 = v11;
  id v15 = (const xmlChar *)objc_msgSend(v14, "UTF8String", v22);
  id v16 = v23;
  id v17 = (const xmlChar *)[v16 UTF8String];
  id v18 = v12;
  id v19 = (const xmlChar *)[v18 UTF8String];
  id v20 = v13;
  LODWORD(v17) = xmlTextWriterWriteDTD(a3, v15, v17, v19, (const xmlChar *)[v20 UTF8String]);
  xmlTextWriterSetIndent(a3, 0);

  return (int)v17 >= 0;
}

+ (BOOL)writeAnchorTargetToStream:(_xmlTextWriter *)a3 name:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(id)objc_opt_class() startPlainElementInStream:a3 name:@"span"]
    && [(id)objc_opt_class() writePlainAttributeToStream:a3 name:@"id" content:v5]&& (objc_msgSend((id)objc_opt_class(), "endElementInStream:", a3) & 1) != 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAddedIds, 0);
  objc_storeStrong((id *)&self->mTextWriterProvider, 0);
}

@end