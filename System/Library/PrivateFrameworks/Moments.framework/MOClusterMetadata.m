@interface MOClusterMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isFiltered;
- (MOClusterMetadata)initWithCoder:(id)a3;
- (MOClusterMetadata)initWithIdentifier:(id)a3 isFiltered:(BOOL)a4 phenoType:(id)a5 topLevelActivityHistogram:(id)a6 secondLevelActivityHistogram:(id)a7 activityTypeFromPhotoTraitsHistogram:(id)a8 timeTagHistogram:(id)a9 dayOfWeekHistogram:(id)a10 weekOfYearHistogram:(id)a11 timeContextFromPhotoTraitsHistogram:(id)a12 placeNameHistogram:(id)a13 combinedPlaceTypeHistogram:(id)a14 enclosingPlaceNameHistogram:(id)a15 placeTypeFromPhotoTraitsHistogram:(id)a16 contactNamesHistogram:(id)a17 personRelationshipHistogram:(id)a18 socialEventFromPhotoTraitsHistogram:(id)a19 otherSubjectFromPhotoTraitsHistogram:(id)a20 subBundleGoodnessScores:(id)a21 subSuggestionIDsBeforePruning:(id)a22;
- (MOClusterMetadata)initWithIdentifier:(id)a3 phenoType:(id)a4;
- (NSArray)subBundleGoodnessScores;
- (NSArray)subSuggestionIDsBeforePruning;
- (NSDictionary)activityTypeFromPhotoTraitsHistogram;
- (NSDictionary)combinedPlaceTypeHistogram;
- (NSDictionary)contactNamesHistogram;
- (NSDictionary)dayOfWeekHistogram;
- (NSDictionary)enclosingPlaceNameHistogram;
- (NSDictionary)otherSubjectFromPhotoTraitsHistogram;
- (NSDictionary)personRelationshipHistogram;
- (NSDictionary)phenotype;
- (NSDictionary)placeNameHistogram;
- (NSDictionary)placeTypeFromPhotoTraitsHistogram;
- (NSDictionary)secondLevelActivityHistogram;
- (NSDictionary)socialEventFromPhotoTraitsHistogram;
- (NSDictionary)timeContextFromPhotoTraitsHistogram;
- (NSDictionary)timeTagHistogram;
- (NSDictionary)topLevelActivityHistogram;
- (NSDictionary)weekOfYearHistogram;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityTypeFromPhotoTraitsHistogram:(id)a3;
- (void)setCombinedPlaceTypeHistogram:(id)a3;
- (void)setContactNamesHistogram:(id)a3;
- (void)setDayOfWeekHistogram:(id)a3;
- (void)setEnclosingPlaceNameHistogram:(id)a3;
- (void)setIsFiltered:(BOOL)a3;
- (void)setOtherSubjectFromPhotoTraitsHistogram:(id)a3;
- (void)setPersonRelationshipHistogram:(id)a3;
- (void)setPhenotype:(id)a3;
- (void)setPlaceNameHistogram:(id)a3;
- (void)setPlaceTypeFromPhotoTraitsHistogram:(id)a3;
- (void)setSecondLevelActivityHistogram:(id)a3;
- (void)setSocialEventFromPhotoTraitsHistogram:(id)a3;
- (void)setSubBundleGoodnessScores:(id)a3;
- (void)setSubSuggestionIDsBeforePruning:(id)a3;
- (void)setTimeContextFromPhotoTraitsHistogram:(id)a3;
- (void)setTimeTagHistogram:(id)a3;
- (void)setTopLevelActivityHistogram:(id)a3;
- (void)setWeekOfYearHistogram:(id)a3;
@end

@implementation MOClusterMetadata

- (MOClusterMetadata)initWithIdentifier:(id)a3 phenoType:(id)a4
{
  return -[MOClusterMetadata initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:weekOfYearHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:subSuggestionIDsBeforePruning:](self, "initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:weekOfYearHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:subSuggestionIDsBeforePruning:", a3, 0, a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (MOClusterMetadata)initWithIdentifier:(id)a3 isFiltered:(BOOL)a4 phenoType:(id)a5 topLevelActivityHistogram:(id)a6 secondLevelActivityHistogram:(id)a7 activityTypeFromPhotoTraitsHistogram:(id)a8 timeTagHistogram:(id)a9 dayOfWeekHistogram:(id)a10 weekOfYearHistogram:(id)a11 timeContextFromPhotoTraitsHistogram:(id)a12 placeNameHistogram:(id)a13 combinedPlaceTypeHistogram:(id)a14 enclosingPlaceNameHistogram:(id)a15 placeTypeFromPhotoTraitsHistogram:(id)a16 contactNamesHistogram:(id)a17 personRelationshipHistogram:(id)a18 socialEventFromPhotoTraitsHistogram:(id)a19 otherSubjectFromPhotoTraitsHistogram:(id)a20 subBundleGoodnessScores:(id)a21 subSuggestionIDsBeforePruning:(id)a22
{
  id v52 = a3;
  id v38 = a5;
  id v51 = a5;
  id v39 = a6;
  id v50 = a6;
  id v49 = a7;
  id v48 = a8;
  id v47 = a9;
  id v46 = a10;
  id v45 = a11;
  id v44 = a12;
  id v43 = a13;
  id v42 = a14;
  id v41 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  id v30 = a20;
  id v31 = a21;
  id v32 = a22;
  v53.receiver = self;
  v53.super_class = (Class)MOClusterMetadata;
  v33 = [(MOClusterMetadata *)&v53 init];
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_identifier, a3);
    v34->_isFiltered = a4;
    objc_storeStrong((id *)&v34->_phenotype, v38);
    objc_storeStrong((id *)&v34->_topLevelActivityHistogram, v39);
    objc_storeStrong((id *)&v34->_secondLevelActivityHistogram, a7);
    objc_storeStrong((id *)&v34->_activityTypeFromPhotoTraitsHistogram, a8);
    objc_storeStrong((id *)&v34->_timeTagHistogram, a9);
    objc_storeStrong((id *)&v34->_dayOfWeekHistogram, a10);
    objc_storeStrong((id *)&v34->_weekOfYearHistogram, a11);
    objc_storeStrong((id *)&v34->_timeContextFromPhotoTraitsHistogram, a12);
    objc_storeStrong((id *)&v34->_placeNameHistogram, a13);
    objc_storeStrong((id *)&v34->_combinedPlaceTypeHistogram, a14);
    objc_storeStrong((id *)&v34->_enclosingPlaceNameHistogram, a15);
    objc_storeStrong((id *)&v34->_placeTypeFromPhotoTraitsHistogram, a16);
    objc_storeStrong((id *)&v34->_contactNamesHistogram, a17);
    objc_storeStrong((id *)&v34->_personRelationshipHistogram, a18);
    objc_storeStrong((id *)&v34->_socialEventFromPhotoTraitsHistogram, a19);
    objc_storeStrong((id *)&v34->_otherSubjectFromPhotoTraitsHistogram, a20);
    objc_storeStrong((id *)&v34->_subBundleGoodnessScores, a21);
    objc_storeStrong((id *)&v34->_subSuggestionIDsBeforePruning, a22);
  }

  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v21 = a3;
  [v21 encodeObject:identifier forKey:@"identifier"];
  [v21 encodeBool:self->_isFiltered forKey:@"isFiltered"];
  v5 = +[MODictionaryEncoder encodeDictionary:self->_phenotype];
  [v21 encodeObject:v5 forKey:@"phenotype"];

  v6 = +[MODictionaryEncoder encodeDictionary:self->_topLevelActivityHistogram];
  [v21 encodeObject:v6 forKey:@"topLevelActivityTypeHistogram"];

  v7 = +[MODictionaryEncoder encodeDictionary:self->_secondLevelActivityHistogram];
  [v21 encodeObject:v7 forKey:@"secondLevelActivityTypeHistogram"];

  v8 = +[MODictionaryEncoder encodeDictionary:self->_activityTypeFromPhotoTraitsHistogram];
  [v21 encodeObject:v8 forKey:@"activityTypeFromPhotoTraitsHistogram"];

  v9 = +[MODictionaryEncoder encodeDictionary:self->_timeTagHistogram];
  [v21 encodeObject:v9 forKey:@"timeTagHistogram"];

  v10 = +[MODictionaryEncoder encodeDictionary:self->_dayOfWeekHistogram];
  [v21 encodeObject:v10 forKey:@"dayOfWeekHistogram"];

  v11 = +[MODictionaryEncoder encodeDictionary:self->_weekOfYearHistogram];
  [v21 encodeObject:v11 forKey:@"weekOfYearHistogram"];

  v12 = +[MODictionaryEncoder encodeDictionary:self->_timeContextFromPhotoTraitsHistogram];
  [v21 encodeObject:v12 forKey:@"timeContextFromPhotoTraitsHistogram"];

  v13 = +[MODictionaryEncoder encodeDictionary:self->_placeNameHistogram];
  [v21 encodeObject:v13 forKey:@"placeNameHistogram"];

  v14 = +[MODictionaryEncoder encodeDictionary:self->_combinedPlaceTypeHistogram];
  [v21 encodeObject:v14 forKey:@"combinedPlaceTypeHistogram"];

  v15 = +[MODictionaryEncoder encodeDictionary:self->_enclosingPlaceNameHistogram];
  [v21 encodeObject:v15 forKey:@"enclosingPlaceNameHistogram"];

  v16 = +[MODictionaryEncoder encodeDictionary:self->_placeTypeFromPhotoTraitsHistogram];
  [v21 encodeObject:v16 forKey:@"placeTypeFromPhotoTraitsHistogram"];

  v17 = +[MODictionaryEncoder encodeDictionary:self->_contactNamesHistogram];
  [v21 encodeObject:v17 forKey:@"contactNamesHistogram"];

  v18 = +[MODictionaryEncoder encodeDictionary:self->_personRelationshipHistogram];
  [v21 encodeObject:v18 forKey:@"personRelationshipHistogram"];

  v19 = +[MODictionaryEncoder encodeDictionary:self->_socialEventFromPhotoTraitsHistogram];
  [v21 encodeObject:v19 forKey:@"socialEventFromPhotoTraitsHistogram"];

  v20 = +[MODictionaryEncoder encodeDictionary:self->_otherSubjectFromPhotoTraitsHistogram];
  [v21 encodeObject:v20 forKey:@"otherSubjectFromPhotoTraitsHistogram"];

  [v21 encodeObject:self->_subBundleGoodnessScores forKey:@"subBundleGoodnessScores"];
  [v21 encodeObject:self->_subSuggestionIDsBeforePruning forKey:@"subSuggestionIDsBeforePruning"];
}

- (MOClusterMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  id v48 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  unsigned int v39 = [v3 decodeBoolForKey:@"isFiltered"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"phenotype"];
  id v47 = +[MODictionaryEncoder decodeToDictionary:v4];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"topLevelActivityTypeHistogram"];
  id v46 = +[MODictionaryEncoder decodeToDictionary:v5];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"secondLevelActivityTypeHistogram"];
  id v45 = +[MODictionaryEncoder decodeToDictionary:v6];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"activityTypeFromPhotoTraitsHistogram"];
  id v44 = +[MODictionaryEncoder decodeToDictionary:v7];

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"timeTagHistogram"];
  id v43 = +[MODictionaryEncoder decodeToDictionary:v8];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"dayOfWeekHistogram"];
  id v42 = +[MODictionaryEncoder decodeToDictionary:v9];

  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"weekOfYearHistogram"];
  id v38 = +[MODictionaryEncoder decodeToDictionary:v10];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"timeContextFromPhotoTraitsHistogram"];
  v37 = +[MODictionaryEncoder decodeToDictionary:v11];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"placeNameHistogram"];
  v36 = +[MODictionaryEncoder decodeToDictionary:v12];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"combinedPlaceTypeHistogram"];
  v35 = +[MODictionaryEncoder decodeToDictionary:v13];

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"enclosingPlaceNameHistogram"];
  id v32 = +[MODictionaryEncoder decodeToDictionary:v14];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"placeTypeFromPhotoTraitsHistogram"];
  v34 = +[MODictionaryEncoder decodeToDictionary:v15];

  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"contactNamesHistogram"];
  v33 = +[MODictionaryEncoder decodeToDictionary:v16];

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"personRelationshipHistogram"];
  v18 = +[MODictionaryEncoder decodeToDictionary:v17];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"socialEventFromPhotoTraitsHistogram"];
  v20 = +[MODictionaryEncoder decodeToDictionary:v19];

  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"otherSubjectFromPhotoTraitsHistogram"];
  id v31 = +[MODictionaryEncoder decodeToDictionary:v21];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v25 = [v3 decodeObjectOfClasses:v24 forKey:@"subBundleGoodnessScores"];

  id v26 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v27 = objc_opt_class();
  id v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  id v29 = [v3 decodeObjectOfClasses:v28 forKey:@"subSuggestionIDsBeforePruning"];

  id v41 = -[MOClusterMetadata initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:weekOfYearHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:subSuggestionIDsBeforePruning:](self, "initWithIdentifier:isFiltered:phenoType:topLevelActivityHistogram:secondLevelActivityHistogram:activityTypeFromPhotoTraitsHistogram:timeTagHistogram:dayOfWeekHistogram:weekOfYearHistogram:timeContextFromPhotoTraitsHistogram:placeNameHistogram:combinedPlaceTypeHistogram:enclosingPlaceNameHistogram:placeTypeFromPhotoTraitsHistogram:contactNamesHistogram:personRelationshipHistogram:socialEventFromPhotoTraitsHistogram:otherSubjectFromPhotoTraitsHistogram:subBundleGoodnessScores:subSuggestionIDsBeforePruning:", v48, v39, v47, v46, v45, v44, v43, v42, v38, v37, v36, v35, v32,
          v34,
          v33,
          v18,
          v20,
          v31,
          v25,
          v29);

  return v41;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)setIsFiltered:(BOOL)a3
{
  self->_isFiltered = a3;
}

- (NSDictionary)phenotype
{
  return self->_phenotype;
}

- (void)setPhenotype:(id)a3
{
}

- (NSDictionary)topLevelActivityHistogram
{
  return self->_topLevelActivityHistogram;
}

- (void)setTopLevelActivityHistogram:(id)a3
{
}

- (NSDictionary)secondLevelActivityHistogram
{
  return self->_secondLevelActivityHistogram;
}

- (void)setSecondLevelActivityHistogram:(id)a3
{
}

- (NSDictionary)activityTypeFromPhotoTraitsHistogram
{
  return self->_activityTypeFromPhotoTraitsHistogram;
}

- (void)setActivityTypeFromPhotoTraitsHistogram:(id)a3
{
}

- (NSDictionary)timeTagHistogram
{
  return self->_timeTagHistogram;
}

- (void)setTimeTagHistogram:(id)a3
{
}

- (NSDictionary)dayOfWeekHistogram
{
  return self->_dayOfWeekHistogram;
}

- (void)setDayOfWeekHistogram:(id)a3
{
}

- (NSDictionary)weekOfYearHistogram
{
  return self->_weekOfYearHistogram;
}

- (void)setWeekOfYearHistogram:(id)a3
{
}

- (NSDictionary)timeContextFromPhotoTraitsHistogram
{
  return self->_timeContextFromPhotoTraitsHistogram;
}

- (void)setTimeContextFromPhotoTraitsHistogram:(id)a3
{
}

- (NSDictionary)placeNameHistogram
{
  return self->_placeNameHistogram;
}

- (void)setPlaceNameHistogram:(id)a3
{
}

- (NSDictionary)combinedPlaceTypeHistogram
{
  return self->_combinedPlaceTypeHistogram;
}

- (void)setCombinedPlaceTypeHistogram:(id)a3
{
}

- (NSDictionary)enclosingPlaceNameHistogram
{
  return self->_enclosingPlaceNameHistogram;
}

- (void)setEnclosingPlaceNameHistogram:(id)a3
{
}

- (NSDictionary)placeTypeFromPhotoTraitsHistogram
{
  return self->_placeTypeFromPhotoTraitsHistogram;
}

- (void)setPlaceTypeFromPhotoTraitsHistogram:(id)a3
{
}

- (NSDictionary)contactNamesHistogram
{
  return self->_contactNamesHistogram;
}

- (void)setContactNamesHistogram:(id)a3
{
}

- (NSDictionary)personRelationshipHistogram
{
  return self->_personRelationshipHistogram;
}

- (void)setPersonRelationshipHistogram:(id)a3
{
}

- (NSDictionary)socialEventFromPhotoTraitsHistogram
{
  return self->_socialEventFromPhotoTraitsHistogram;
}

- (void)setSocialEventFromPhotoTraitsHistogram:(id)a3
{
}

- (NSDictionary)otherSubjectFromPhotoTraitsHistogram
{
  return self->_otherSubjectFromPhotoTraitsHistogram;
}

- (void)setOtherSubjectFromPhotoTraitsHistogram:(id)a3
{
}

- (NSArray)subBundleGoodnessScores
{
  return self->_subBundleGoodnessScores;
}

- (void)setSubBundleGoodnessScores:(id)a3
{
}

- (NSArray)subSuggestionIDsBeforePruning
{
  return self->_subSuggestionIDsBeforePruning;
}

- (void)setSubSuggestionIDsBeforePruning:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subSuggestionIDsBeforePruning, 0);
  objc_storeStrong((id *)&self->_subBundleGoodnessScores, 0);
  objc_storeStrong((id *)&self->_otherSubjectFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_socialEventFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_personRelationshipHistogram, 0);
  objc_storeStrong((id *)&self->_contactNamesHistogram, 0);
  objc_storeStrong((id *)&self->_placeTypeFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_enclosingPlaceNameHistogram, 0);
  objc_storeStrong((id *)&self->_combinedPlaceTypeHistogram, 0);
  objc_storeStrong((id *)&self->_placeNameHistogram, 0);
  objc_storeStrong((id *)&self->_timeContextFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_weekOfYearHistogram, 0);
  objc_storeStrong((id *)&self->_dayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_timeTagHistogram, 0);
  objc_storeStrong((id *)&self->_activityTypeFromPhotoTraitsHistogram, 0);
  objc_storeStrong((id *)&self->_secondLevelActivityHistogram, 0);
  objc_storeStrong((id *)&self->_topLevelActivityHistogram, 0);
  objc_storeStrong((id *)&self->_phenotype, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end