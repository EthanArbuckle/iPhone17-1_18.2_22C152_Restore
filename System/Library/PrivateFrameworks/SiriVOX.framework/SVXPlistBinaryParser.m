@interface SVXPlistBinaryParser
- (id)dataWithPropertyList:(id)a3 format:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6;
@end

@implementation SVXPlistBinaryParser

- (id)dataWithPropertyList:(id)a3 format:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  return (id)[MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:a4 options:a5 error:a6];
}

@end