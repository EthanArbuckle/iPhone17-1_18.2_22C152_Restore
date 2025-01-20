@interface BTVCLinkAdvertiseSet
@end

@implementation BTVCLinkAdvertiseSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->data, 0);
  objc_storeStrong((id *)&self->parameters, 0);

  objc_storeStrong((id *)&self->address, 0);
}

@end