@interface TTSFormatArgument
@end

@implementation TTSFormatArgument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->formattedArg, 0);
  objc_storeStrong((id *)&self->attributes, 0);

  objc_storeStrong((id *)&self->formatSpecifier, 0);
}

@end