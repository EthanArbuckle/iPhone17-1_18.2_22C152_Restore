@interface MRMutableVirtualVoiceInputDeviceDescriptor
- (void)setDefaultFormat:(id)a3;
- (void)setSupportedFormats:(id)a3;
@end

@implementation MRMutableVirtualVoiceInputDeviceDescriptor

- (void)setSupportedFormats:(id)a3
{
  if (self->super._supportedFormats != a3)
  {
    v4 = (NSArray *)[a3 copy];
    supportedFormats = self->super._supportedFormats;
    self->super._supportedFormats = v4;
    MEMORY[0x1F41817F8](v4, supportedFormats);
  }
}

- (void)setDefaultFormat:(id)a3
{
  if (self->super._defaultFormat != a3)
  {
    v4 = (NSDictionary *)[a3 copy];
    defaultFormat = self->super._defaultFormat;
    self->super._defaultFormat = v4;
    MEMORY[0x1F41817F8](v4, defaultFormat);
  }
}

@end