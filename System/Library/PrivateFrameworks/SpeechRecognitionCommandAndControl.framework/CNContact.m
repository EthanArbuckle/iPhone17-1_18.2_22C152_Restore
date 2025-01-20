@interface CNContact
@end

@implementation CNContact

void __51__CNContact_VoiceDial__callNumberWithLabeledValue___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v8 = +[CACDisplayManager sharedManager];
    v4 = NSString;
    v5 = +[CACLocaleUtilities localizedUIStringForKey:@"DialMessage.DialingErrorAt"];
    v6 = [MEMORY[0x263EFEA20] stringFromContact:*(void *)(a1 + 32) style:0];
    v7 = [v4 stringWithValidatedFormat:v5, @"%@%@", 0, v6, *(void *)(a1 + 40) validFormatSpecifiers error];
    [v8 displayMessageString:v7 type:0 announcementCompletion:0];
  }
}

void __54__CNContact_VoiceDial__faceTimeEmailWithLabeledValue___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v8 = +[CACDisplayManager sharedManager];
    v4 = NSString;
    v5 = +[CACLocaleUtilities localizedUIStringForKey:@"DialMessage.FaceTimeErrorAt"];
    v6 = [MEMORY[0x263EFEA20] stringFromContact:*(void *)(a1 + 32) style:0];
    v7 = [v4 stringWithValidatedFormat:v5, @"%@%@", 0, v6, *(void *)(a1 + 40) validFormatSpecifiers error];
    [v8 displayMessageString:v7 type:0 announcementCompletion:0];
  }
}

@end