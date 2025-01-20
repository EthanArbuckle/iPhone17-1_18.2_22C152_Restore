@interface OAXFontReference
+ (void)readFromNode:(_xmlNode *)a3 fontReference:(id)a4;
+ (void)writeReference:(id)a3 to:(id)a4 state:(id)a5;
@end

@implementation OAXFontReference

+ (void)readFromNode:(_xmlNode *)a3 fontReference:(id)a4
{
  id v6 = a4;
  if (+[OAXFontReference readFromNode:fontReference:]::once != -1) {
    dispatch_once(&+[OAXFontReference readFromNode:fontReference:]::once, &__block_literal_global_48);
  }
  objc_msgSend(v6, "setIndex:", objc_msgSend((id)+[OAXFontReference readFromNode:fontReference:]::indexMap, "readFromNode:ns:name:", a3, 0, "idx"));
  v5 = +[OAXColor readColorFromParentXmlNode:a3];
  [v6 setColor:v5];
}

void __47__OAXFontReference_readFromNode_fontReference___block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions))
  {
    qword_268991BD0 = (uint64_t)"major";
    dword_268991BD8 = 1;
    qword_268991BE0 = (uint64_t)"minor";
    dword_268991BE8 = -1;
    _ZZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions = 0;
    qword_268991BF0 = (uint64_t)"none";
    xmmword_268991BF8 = TCXmlEnumSentinel;
    __cxa_guard_release(&_ZGVZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions);
  }
  v0 = [[TCXmlEnumMap alloc] initWithDescriptions:&_ZZZ47__OAXFontReference_readFromNode_fontReference__EUb_E17indexDescriptions];
  v1 = (void *)+[OAXFontReference readFromNode:fontReference:]::indexMap;
  +[OAXFontReference readFromNode:fontReference:]::indexMap = (uint64_t)v0;
}

+ (void)writeReference:(id)a3 to:(id)a4 state:(id)a5
{
  id v10 = a3;
  id v6 = a4;
  [v6 startElement:@"fontRef"];
  unsigned int v7 = [v10 index] + 1;
  if (v7 < 3) {
    [v6 writeAttribute:@"idx" content:off_264D62508[v7]];
  }
  v8 = [v10 color];

  if (v8)
  {
    v9 = [v10 color];
    +[OAXColor writeColor:v9 to:v6];
  }
  [v6 endElement];
}

@end