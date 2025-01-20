@interface PLDescriptionStyle
@end

@implementation PLDescriptionStyle

void __36___PLDescriptionStyle_styleForEnum___block_invoke_4()
{
  v0 = [[_PLDescriptionStyle alloc] initWithIntialFieldSeparator:@"> {\n" fieldSeparator:@"\n" nameValueSeparator:@": " suffix:@"}" extraIndent:1 prettyPrint:1];
  v1 = (void *)styleForEnum__pl_once_object_20;
  styleForEnum__pl_once_object_20 = (uint64_t)v0;
}

void __36___PLDescriptionStyle_styleForEnum___block_invoke_3()
{
  v0 = [[_PLDescriptionStyle alloc] initWithIntialFieldSeparator:&stru_1EEB2EB80 fieldSeparator:@"\n" nameValueSeparator:@": " suffix:&stru_1EEB2EB80 extraIndent:0 prettyPrint:0];
  v1 = (void *)styleForEnum__pl_once_object_19;
  styleForEnum__pl_once_object_19 = (uint64_t)v0;
}

void __36___PLDescriptionStyle_styleForEnum___block_invoke_2()
{
  v0 = [[_PLDescriptionStyle alloc] initWithIntialFieldSeparator:&stru_1EEB2EB80 fieldSeparator:@", " nameValueSeparator:@"=" suffix:&stru_1EEB2EB80 extraIndent:0 prettyPrint:0];
  v1 = (void *)styleForEnum__pl_once_object_18;
  styleForEnum__pl_once_object_18 = (uint64_t)v0;
}

void __36___PLDescriptionStyle_styleForEnum___block_invoke()
{
  v0 = [[_PLDescriptionStyle alloc] initWithIntialFieldSeparator:@": " fieldSeparator:@", " nameValueSeparator:@"=" suffix:@">" extraIndent:0 prettyPrint:0];
  v1 = (void *)styleForEnum__pl_once_object_17;
  styleForEnum__pl_once_object_17 = (uint64_t)v0;
}

@end