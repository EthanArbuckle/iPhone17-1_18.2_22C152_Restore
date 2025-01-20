@interface RBEmptyDisplayListContents
+ (uint64_t)shared;
- (BOOL)isEmpty;
- (CGRect)boundingRect;
- (const)_rb_contents;
- (const)_rb_xml_document;
- (id)encodedDataForDelegate:(id)a3 error:(id *)a4;
@end

@implementation RBEmptyDisplayListContents

- (BOOL)isEmpty
{
  return 1;
}

+ (uint64_t)shared
{
  {
    +[RBEmptyDisplayListContents shared]::shared = objc_opt_new();
  }
  return +[RBEmptyDisplayListContents shared]::shared;
}

- (CGRect)boundingRect
{
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (const)_rb_contents
{
  return 0;
}

- (const)_rb_xml_document
{
  {
    operator new();
  }
  return (const void *)-[RBEmptyDisplayListContents _rb_xml_document]::shared_doc;
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  {
    operator new();
  }
  v6 = (RB::DisplayList::Contents *)-[RBEmptyDisplayListContents encodedDataForDelegate:error:]::empty;
  return (id)encode_contents(v6, a3, a4);
}

@end