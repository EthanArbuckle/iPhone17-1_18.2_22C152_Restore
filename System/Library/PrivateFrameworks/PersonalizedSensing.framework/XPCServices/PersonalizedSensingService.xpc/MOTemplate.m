@interface MOTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCityName;
- (BOOL)hasPersonName;
- (BOOL)hasPlaceName;
- (BOOL)hasTimeReference;
- (BOOL)isEqual:(id)a3;
- (MOTemplate)initWithCoder:(id)a3;
- (MOTemplate)initWithTemplateIdentifier:(id)a3;
- (MOTemplate)initWithTemplateIdentifier:(id)a3 patternType:(unint64_t)a4 placeType:(unint64_t)a5 activityType:(unint64_t)a6 time:(unint64_t)a7 bundleType:(unint64_t)a8 peopleClassification:(unint64_t)a9 hasPersonName:(BOOL)a10 hasPlaceName:(BOOL)a11 hasCityName:(BOOL)a12 hasTimeReference:(BOOL)a13 templateString:(id)a14 utility:(double)a15 accuracy:(double)a16 satisfaction:(double)a17 generalizability:(double)a18 promptIndex:(unint64_t)a19;
- (MOTemplate)initWithTemplateMO:(id)a3;
- (NSArray)globalTraits;
- (NSString)templateString;
- (NSUUID)templateIdentifier;
- (double)accuracy;
- (double)generalizability;
- (double)satisfaction;
- (double)totalScore;
- (double)utility;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)activityType;
- (unint64_t)bundleType;
- (unint64_t)patternType;
- (unint64_t)peopleClassification;
- (unint64_t)photoTrait;
- (unint64_t)placeType;
- (unint64_t)promptIndex;
- (unint64_t)promptVersion;
- (unint64_t)time;
- (void)encodeWithCoder:(id)a3;
- (void)setAccuracy:(double)a3;
- (void)setActivityType:(unint64_t)a3;
- (void)setBundleType:(unint64_t)a3;
- (void)setGeneralizability:(double)a3;
- (void)setGlobalTraits:(id)a3;
- (void)setHasCityName:(BOOL)a3;
- (void)setHasPersonName:(BOOL)a3;
- (void)setHasPlaceName:(BOOL)a3;
- (void)setHasTimeReference:(BOOL)a3;
- (void)setPatternType:(unint64_t)a3;
- (void)setPeopleClassification:(unint64_t)a3;
- (void)setPhotoTrait:(unint64_t)a3;
- (void)setPlaceType:(unint64_t)a3;
- (void)setPromptIndex:(unint64_t)a3;
- (void)setPromptVersion:(unint64_t)a3;
- (void)setSatisfaction:(double)a3;
- (void)setTemplateIdentifier:(id)a3;
- (void)setTemplateString:(id)a3;
- (void)setTime:(unint64_t)a3;
- (void)setTotalScore:(double)a3;
- (void)setUtility:(double)a3;
@end

@implementation MOTemplate

- (MOTemplate)initWithTemplateMO:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MOTemplate alloc];
    v6 = [v4 templateIdentifier];
    v7 = [(MOTemplate *)v5 initWithTemplateIdentifier:v6];

    v8 = [v4 templateString];
    [(MOTemplate *)v7 setTemplateString:v8];

    -[MOTemplate setPatternType:](v7, "setPatternType:", [v4 patternType]);
    -[MOTemplate setActivityType:](v7, "setActivityType:", [v4 activityType]);
    -[MOTemplate setPlaceType:](v7, "setPlaceType:", [v4 placeType]);
    -[MOTemplate setTime:](v7, "setTime:", [v4 time]);
    -[MOTemplate setBundleType:](v7, "setBundleType:", [v4 bundleType]);
    -[MOTemplate setPeopleClassification:](v7, "setPeopleClassification:", [v4 peopleClassification]);
    -[MOTemplate setHasPersonName:](v7, "setHasPersonName:", [v4 hasPersonName]);
    -[MOTemplate setHasPlaceName:](v7, "setHasPlaceName:", [v4 hasPlaceName]);
    -[MOTemplate setHasCityName:](v7, "setHasCityName:", [v4 hasCityName]);
    -[MOTemplate setHasTimeReference:](v7, "setHasTimeReference:", [v4 hasTimeReference]);
    -[MOTemplate setPhotoTrait:](v7, "setPhotoTrait:", [v4 photoTrait]);
    [v4 utility];
    -[MOTemplate setUtility:](v7, "setUtility:");
    [v4 accuracy];
    -[MOTemplate setAccuracy:](v7, "setAccuracy:");
    [v4 satisfaction];
    -[MOTemplate setSatisfaction:](v7, "setSatisfaction:");
    [v4 generalizability];
    -[MOTemplate setGeneralizability:](v7, "setGeneralizability:");
    -[MOTemplate setPromptIndex:](v7, "setPromptIndex:", [v4 promptIndex]);
    [v4 totalScore];
    -[MOTemplate setTotalScore:](v7, "setTotalScore:");
    NSSelectorFromString(@"globalTraits");
    if (objc_opt_respondsToSelector())
    {
      v9 = objc_opt_new();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v10 = objc_msgSend(v4, "globalTraits", 0);
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [[MOGlobalTrait alloc] initWithGlobalTraitMO:*(void *)(*((void *)&v18 + 1) + 8 * i)];
            [v9 addObject:v15];
          }
          id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }

      id v16 = [v9 copy];
      [(MOTemplate *)v7 setGlobalTraits:v16];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MOTemplate)initWithTemplateIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOTemplate;
  v6 = [(MOTemplate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_templateIdentifier, a3);
  }

  return v7;
}

- (MOTemplate)initWithTemplateIdentifier:(id)a3 patternType:(unint64_t)a4 placeType:(unint64_t)a5 activityType:(unint64_t)a6 time:(unint64_t)a7 bundleType:(unint64_t)a8 peopleClassification:(unint64_t)a9 hasPersonName:(BOOL)a10 hasPlaceName:(BOOL)a11 hasCityName:(BOOL)a12 hasTimeReference:(BOOL)a13 templateString:(id)a14 utility:(double)a15 accuracy:(double)a16 satisfaction:(double)a17 generalizability:(double)a18 promptIndex:(unint64_t)a19
{
  id v30 = a3;
  id v31 = a14;
  v35.receiver = self;
  v35.super_class = (Class)MOTemplate;
  v32 = [(MOTemplate *)&v35 init];
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_templateIdentifier, a3);
    v33->_patternType = a4;
    v33->_activityType = a6;
    v33->_placeType = a5;
    v33->_time = a7;
    v33->_bundleType = a8;
    v33->_peopleClassification = a9;
    v33->_hasPersonName = a10;
    v33->_hasPlaceName = a11;
    v33->_hasCityName = a12;
    v33->_hasTimeReference = a13;
    objc_storeStrong((id *)&v33->_templateString, a14);
    v33->_utility = a15;
    v33->_accuracy = a16;
    v33->_satisfaction = a17;
    v33->_generalizability = a18;
    v33->_promptIndex = a19;
  }

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  templateIdentifier = self->_templateIdentifier;
  id v5 = a3;
  [v5 encodeObject:templateIdentifier forKey:@"templateIdentifier"];
  [v5 encodeInteger:self->_patternType forKey:@"patternType"];
  [v5 encodeInteger:self->_placeType forKey:@"placeType"];
  [v5 encodeInteger:self->_bundleType forKey:@"bundleType"];
  [v5 encodeInteger:self->_peopleClassification forKey:@"peopleClassification"];
  [v5 encodeInteger:self->_time forKey:@"time"];
  [v5 encodeInteger:self->_activityType forKey:@"activityType"];
  [v5 encodeBool:self->_hasPersonName forKey:@"hasPersonName"];
  [v5 encodeBool:self->_hasPlaceName forKey:@"hasPlaceName"];
  [v5 encodeBool:self->_hasCityName forKey:@"hasCityName"];
  [v5 encodeBool:self->_hasTimeReference forKey:@"hasTimeReference"];
  [v5 encodeInteger:self->_photoTrait forKey:@"photoTrait"];
  [v5 encodeObject:self->_globalTraits forKey:@"globalTraits"];
  [v5 encodeObject:self->_templateString forKey:@"templateString"];
  [v5 encodeDouble:@"utility" forKey:self->_utility];
  [v5 encodeDouble:@"accuracy" forKey:self->_accuracy];
  [v5 encodeDouble:@"satisfaction" forKey:self->_satisfaction];
  [v5 encodeDouble:@"generalizability" forKey:self->_generalizability];
  [v5 encodeInteger:self->_promptIndex forKey:@"promptIndex"];
  [v5 encodeDouble:@"totalScore" forKey:self->_totalScore];
  [v5 encodeInteger:self->_promptVersion forKey:@"promptVersion"];
}

- (MOTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MOTemplate;
  id v5 = [(MOTemplate *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templateIdentifier"];
    templateIdentifier = v5->_templateIdentifier;
    v5->_templateIdentifier = (NSUUID *)v6;

    v5->_patternType = (unint64_t)[v4 decodeIntegerForKey:@"patternType"];
    v5->_placeType = (unint64_t)[v4 decodeIntegerForKey:@"placeType"];
    v5->_bundleType = (unint64_t)[v4 decodeIntegerForKey:@"bundleType"];
    v5->_peopleClassification = (unint64_t)[v4 decodeIntegerForKey:@"peopleClassification"];
    v5->_time = (unint64_t)[v4 decodeIntegerForKey:@"time"];
    v5->_activityType = (unint64_t)[v4 decodeIntegerForKey:@"activityType"];
    v5->_photoTrait = (unint64_t)[v4 decodeIntegerForKey:@"photoTrait"];
    uint64_t v8 = objc_opt_class();
    objc_super v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"globalTraits"];
    globalTraits = v5->_globalTraits;
    v5->_globalTraits = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templateString"];
    templateString = v5->_templateString;
    v5->_templateString = (NSString *)v12;

    v5->_hasPersonName = [v4 decodeBoolForKey:@"hasPersonName"];
    v5->_hasPlaceName = [v4 decodeBoolForKey:@"hasPlaceName"];
    v5->_hasCityName = [v4 decodeBoolForKey:@"hasCityName"];
    v5->_hasTimeReference = [v4 decodeBoolForKey:@"hasTimeReference"];
    [v4 decodeDoubleForKey:@"utility"];
    v5->_utility = v14;
    [v4 decodeDoubleForKey:@"accuracy"];
    v5->_accuracy = v15;
    [v4 decodeDoubleForKey:@"satisfaction"];
    v5->_satisfaction = v16;
    [v4 decodeDoubleForKey:@"generalizability"];
    v5->_generalizability = v17;
    v5->_promptIndex = (unint64_t)[v4 decodeIntegerForKey:@"promptIndex"];
    [v4 decodeDoubleForKey:@"totalScore"];
    v5->_totalScore = v18;
    v5->_promptVersion = (int)[v4 decodeIntForKey:@"promptVersion"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOTemplate);
  objc_storeStrong((id *)&v4->_templateIdentifier, self->_templateIdentifier);
  v4->_patternType = self->_patternType;
  v4->_placeType = self->_placeType;
  v4->_peopleClassification = self->_peopleClassification;
  v4->_time = self->_time;
  v4->_activityType = self->_activityType;
  v4->_photoTrait = self->_photoTrait;
  objc_storeStrong((id *)&v4->_globalTraits, self->_globalTraits);
  objc_storeStrong((id *)&v4->_templateString, self->_templateString);
  v4->_hasPersonName = self->_hasPersonName;
  v4->_hasPlaceName = self->_hasPlaceName;
  v4->_hasCityName = self->_hasCityName;
  v4->_hasTimeReference = self->_hasTimeReference;
  v4->_utility = self->_utility;
  v4->_accuracy = self->_accuracy;
  v4->_satisfaction = self->_satisfaction;
  v4->_generalizability = self->_generalizability;
  v4->_promptIndex = self->_promptIndex;
  v4->_totalScore = self->_totalScore;
  v4->_promptVersion = self->_promptVersion;
  return v4;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"template id, %@, template string, %@, accuracy,%f, satisfaction,%f, has place name, %d, has city name, %d, has person name, %d, has time reference, %d, pattern type, %lu, prompt index, %lu, totalScore, %f", self->_templateIdentifier, self->_templateString, *(void *)&self->_accuracy, *(void *)&self->_satisfaction, self->_hasPlaceName, self->_hasCityName, self->_hasPersonName, self->_hasTimeReference, self->_patternType, self->_promptIndex, *(void *)&self->_totalScore];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOTemplate *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v6;
        uint64_t v8 = [(MOTemplate *)self templateIdentifier];
        if (v8
          || ([(MOTemplate *)v7 templateIdentifier],
              (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_super v9 = [(MOTemplate *)self templateIdentifier];
          uint64_t v10 = [(MOTemplate *)v7 templateIdentifier];
          unsigned __int8 v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            uint64_t v13 = [(MOTemplate *)self templateString];
            if (v13
              || ([(MOTemplate *)v7 templateString],
                  (v3 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              double v14 = [(MOTemplate *)self templateString];
              double v15 = [(MOTemplate *)v7 templateString];
              unsigned __int8 v16 = [v14 isEqual:v15];

              if (v13)
              {
LABEL_18:

                char v12 = v11 & v16;
                goto LABEL_19;
              }
            }
            else
            {
              unsigned __int8 v16 = 1;
            }

            goto LABEL_18;
          }
        }
        else
        {
          unsigned __int8 v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v12 = 0;
  }
LABEL_19:

  return v12;
}

- (NSUUID)templateIdentifier
{
  return self->_templateIdentifier;
}

- (void)setTemplateIdentifier:(id)a3
{
}

- (unint64_t)patternType
{
  return self->_patternType;
}

- (void)setPatternType:(unint64_t)a3
{
  self->_patternType = a3;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(unint64_t)a3
{
  self->_activityType = a3;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (void)setPlaceType:(unint64_t)a3
{
  self->_placeType = a3;
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  self->_time = a3;
}

- (unint64_t)bundleType
{
  return self->_bundleType;
}

- (void)setBundleType:(unint64_t)a3
{
  self->_bundleType = a3;
}

- (unint64_t)peopleClassification
{
  return self->_peopleClassification;
}

- (void)setPeopleClassification:(unint64_t)a3
{
  self->_peopleClassification = a3;
}

- (BOOL)hasPersonName
{
  return self->_hasPersonName;
}

- (void)setHasPersonName:(BOOL)a3
{
  self->_hasPersonName = a3;
}

- (BOOL)hasPlaceName
{
  return self->_hasPlaceName;
}

- (void)setHasPlaceName:(BOOL)a3
{
  self->_hasPlaceName = a3;
}

- (BOOL)hasCityName
{
  return self->_hasCityName;
}

- (void)setHasCityName:(BOOL)a3
{
  self->_hasCityName = a3;
}

- (BOOL)hasTimeReference
{
  return self->_hasTimeReference;
}

- (void)setHasTimeReference:(BOOL)a3
{
  self->_hasTimeReference = a3;
}

- (unint64_t)photoTrait
{
  return self->_photoTrait;
}

- (void)setPhotoTrait:(unint64_t)a3
{
  self->_photoTrait = a3;
}

- (NSString)templateString
{
  return self->_templateString;
}

- (void)setTemplateString:(id)a3
{
}

- (NSArray)globalTraits
{
  return self->_globalTraits;
}

- (void)setGlobalTraits:(id)a3
{
}

- (double)utility
{
  return self->_utility;
}

- (void)setUtility:(double)a3
{
  self->_utility = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (double)satisfaction
{
  return self->_satisfaction;
}

- (void)setSatisfaction:(double)a3
{
  self->_satisfaction = a3;
}

- (double)generalizability
{
  return self->_generalizability;
}

- (void)setGeneralizability:(double)a3
{
  self->_generalizability = a3;
}

- (unint64_t)promptIndex
{
  return self->_promptIndex;
}

- (void)setPromptIndex:(unint64_t)a3
{
  self->_promptIndex = a3;
}

- (double)totalScore
{
  return self->_totalScore;
}

- (void)setTotalScore:(double)a3
{
  self->_totalScore = a3;
}

- (unint64_t)promptVersion
{
  return self->_promptVersion;
}

- (void)setPromptVersion:(unint64_t)a3
{
  self->_promptVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalTraits, 0);
  objc_storeStrong((id *)&self->_templateString, 0);
  objc_storeStrong((id *)&self->_templateIdentifier, 0);
}

@end