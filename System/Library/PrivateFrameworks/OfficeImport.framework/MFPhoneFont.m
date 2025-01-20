@interface MFPhoneFont
- (__CTFont)createCTFontEquivalent;
@end

@implementation MFPhoneFont

- (__CTFont)createCTFontEquivalent
{
  if (!-[MFPhoneFont createCTFontEquivalent]::familiesAvailable)
  {
    v3 = TCFontFamilyNames();
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v3];
    v5 = (void *)-[MFPhoneFont createCTFontEquivalent]::familiesAvailable;
    -[MFPhoneFont createCTFontEquivalent]::familiesAvailable = v4;
  }
  v6 = self->super.m_lfFaceName;
  if ([(NSString *)self->super.m_lfFaceName isEqualToString:@"ZapfDingbats"])
  {

    v6 = @"Zapf Dingbats";
  }
  if ([(__CFString *)v6 length]
    && ([(id)-[MFPhoneFont createCTFontEquivalent]::familiesAvailable containsObject:v6] & 1) != 0)
  {
    goto LABEL_7;
  }
  int m_lfCharSet = self->super.m_lfCharSet;
  if (m_lfCharSet <= 160)
  {
    switch(m_lfCharSet)
    {
      case 128:

        v6 = @"Heiti J";
        break;
      case 129:
      case 130:

        v6 = @"Heiti K";
        break;
      case 131:
      case 132:
      case 133:
      case 135:
        goto LABEL_7;
      case 134:

        v6 = @"Heiti SC";
        break;
      case 136:

        v6 = @"Heiti TC";
        break;
      default:
        if (m_lfCharSet < 2 || m_lfCharSet == 77) {
          goto LABEL_28;
        }
        break;
    }
    goto LABEL_7;
  }
  if (m_lfCharSet <= 185)
  {
    if ((m_lfCharSet - 161) >= 3)
    {
      if (m_lfCharSet == 177)
      {

        v6 = @"Arial Hebrew";
      }
      else if (m_lfCharSet == 178)
      {

        v6 = @"Gill Sans";
      }
      goto LABEL_7;
    }
    goto LABEL_28;
  }
  if (m_lfCharSet <= 221)
  {
    if (m_lfCharSet != 186 && m_lfCharSet != 204) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
  if (m_lfCharSet == 222)
  {

    v6 = @"Thonburi";
    goto LABEL_7;
  }
  if (m_lfCharSet == 238 || m_lfCharSet == 255)
  {
LABEL_28:
    HIDWORD(v11) = self->super.m_family;
    LODWORD(v11) = HIDWORD(v11);
    switch((v11 >> 4))
    {
      case 1u:

        v6 = @"Times New Roman";
        break;
      case 2u:

        v6 = @"Helvetica";
        break;
      case 3u:

        v6 = @"Courier New";
        break;
      case 4u:

        v6 = @"Noteworthy";
        break;
      case 5u:

        v6 = @"Marker Felt";
        break;
      default:
        int m_pitch = self->super.m_pitch;

        if (m_pitch == 1) {
          v6 = @"Courier New";
        }
        else {
          v6 = @"Helvetica";
        }
        break;
    }
  }
LABEL_7:
  int m_lfHeight = self->super.m_lfHeight;
  if (m_lfHeight < 0) {
    int m_lfHeight = -m_lfHeight;
  }
  v8 = TCCreateFontWithFamilyName((NSString *)v6, self->super.m_lfWeight > 400, self->super.m_lfItalic, (double)m_lfHeight);

  return v8;
}

@end