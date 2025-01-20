@interface WFSoundRecognitionTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)supportsSecureCoding;
+ (double)displayGlyphCornerRadius;
+ (id)displayGlyph;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (NSSet)soundDetectionTypes;
- (WFSoundRecognitionTrigger)init;
- (WFSoundRecognitionTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSoundDetectionTypes:(id)a3;
@end

@implementation WFSoundRecognitionTrigger

- (void).cxx_destruct
{
}

- (void)setSoundDetectionTypes:(id)a3
{
}

- (NSSet)soundDetectionTypes
{
  return self->_soundDetectionTypes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFSoundRecognitionTrigger;
  id v4 = [(WFTrigger *)&v8 copyWithZone:a3];
  v5 = [(WFSoundRecognitionTrigger *)self soundDetectionTypes];
  v6 = (void *)[v5 copy];
  [v4 setSoundDetectionTypes:v6];

  return v4;
}

- (WFSoundRecognitionTrigger)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFSoundRecognitionTrigger;
  v5 = [(WFTrigger *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    objc_super v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"soundDetectionTypes"];
    soundDetectionTypes = v5->_soundDetectionTypes;
    v5->_soundDetectionTypes = (NSSet *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSoundRecognitionTrigger;
  id v4 = a3;
  [(WFTrigger *)&v6 encodeWithCoder:v4];
  v5 = [(WFSoundRecognitionTrigger *)self soundDetectionTypes];
  [v4 encodeObject:v5 forKey:@"soundDetectionTypes"];
}

- (WFSoundRecognitionTrigger)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFSoundRecognitionTrigger;
  v2 = [(WFTrigger *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    soundDetectionTypes = v2->_soundDetectionTypes;
    v2->_soundDetectionTypes = (NSSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)hasValidConfiguration
{
  v2 = [(WFSoundRecognitionTrigger *)self soundDetectionTypes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (double)displayGlyphCornerRadius
{
  return 6.525;
}

+ (id)displayGlyph
{
  v2 = (void *)MEMORY[0x1E4FB4770];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  id v4 = [v2 imageNamed:@"SoundRecognitionTriggerIcon" inBundle:v3];

  return v4;
}

+ (id)localizedDisplayExplanation
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  BOOL v3 = [v2 localizedModel];

  id v4 = NSString;
  v5 = WFLocalizedString(@"Ex. “When my %@ recognizes a doorbell sound”");
  objc_super v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);

  return v6;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Sound Recognition");
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

@end