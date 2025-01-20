@interface MNGuidanceLaneInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isForManeuver;
- (MNGuidanceLaneInfo)initWithCoder:(id)a3;
- (MNGuidanceLaneInfo)initWithID:(id)a3 isForManeuver:(BOOL)a4 lanes:(id)a5 titles:(id)a6 instructions:(id)a7 variableOverrides:(id)a8 distanceDetailLevel:(int64_t)a9 composedGuidanceEventIndex:(int)a10;
- (NSArray)instructions;
- (NSArray)lanes;
- (NSArray)primaryStrings;
- (NSArray)secondaryStrings;
- (NSArray)titles;
- (NSDictionary)variableOverrides;
- (NSUUID)uniqueID;
- (id)description;
- (int)composedGuidanceEventIndex;
- (int64_t)distanceDetailLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setPrimaryStrings:(id)a3;
- (void)setSecondaryStrings:(id)a3;
@end

@implementation MNGuidanceLaneInfo

- (MNGuidanceLaneInfo)initWithID:(id)a3 isForManeuver:(BOOL)a4 lanes:(id)a5 titles:(id)a6 instructions:(id)a7 variableOverrides:(id)a8 distanceDetailLevel:(int64_t)a9 composedGuidanceEventIndex:(int)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v24 = a7;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MNGuidanceLaneInfo;
  v20 = [(MNGuidanceLaneInfo *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uniqueID, a3);
    v21->_isForManeuver = a4;
    objc_storeStrong((id *)&v21->_lanes, a5);
    objc_storeStrong((id *)&v21->_titles, a6);
    objc_storeStrong((id *)&v21->_instructions, a7);
    objc_storeStrong((id *)&v21->_variableOverrides, a8);
    v21->_distanceDetailLevel = a9;
    v21->_composedGuidanceEventIndex = a10;
  }

  return v21;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  v4 = descriptionForLaneInfos();
  [v3 addObject:v4];
  v5 = [(NSArray *)self->_titles firstObject];
  if (v5)
  {
    v6 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v5, 0, 0, 0, self->_variableOverrides);
    if (v6) {
      [v3 addObject:v6];
    }
  }
  v7 = [(NSArray *)self->_instructions firstObject];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 formatTokens];
    v10 = [v9 firstObject];

    uint64_t v11 = [v10 type];
    v12 = NSString;
    if (v11 == 11)
    {
      v13 = [v10 stringValue];
      v14 = [v12 stringWithFormat:@"{%@}", v13];

      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
      v14 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v8, 0, 0, 0, self->_variableOverrides);
      if (!v14)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    [v3 addObject:v14];
    goto LABEL_11;
  }
LABEL_12:
  v15 = [v3 componentsJoinedByString:@", "];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceLaneInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MNGuidanceLaneInfo;
  v5 = [(MNGuidanceLaneInfo *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    v5->_isForManeuver = [v4 decodeBoolForKey:@"IsForManeuver"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Lanes"];
    lanes = v5->_lanes;
    v5->_lanes = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"Titles"];
    titles = v5->_titles;
    v5->_titles = (NSArray *)v16;

    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"Instructions"];
    instructions = v5->_instructions;
    v5->_instructions = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    objc_super v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"_primaryStrings"];
    primaryStrings = v5->_primaryStrings;
    v5->_primaryStrings = (NSArray *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"_secondaryStrings"];
    secondaryStrings = v5->_secondaryStrings;
    v5->_secondaryStrings = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    v36 = objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"VariableOverrides"];
    variableOverrides = v5->_variableOverrides;
    v5->_variableOverrides = (NSDictionary *)v37;

    v5->_distanceDetailLevel = [v4 decodeIntegerForKey:@"DistanceDetailLevel"];
    v5->_composedGuidanceEventIndex = [v4 decodeInt32ForKey:@"ComposedGuidanceEventIndex"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  id v4 = [(MNGuidanceLaneInfo *)self uniqueID];

  if (v4)
  {
    v5 = [(MNGuidanceLaneInfo *)self uniqueID];
    [v14 encodeObject:v5 forKey:@"UniqueID"];
  }
  objc_msgSend(v14, "encodeBool:forKey:", -[MNGuidanceLaneInfo isForManeuver](self, "isForManeuver"), @"IsForManeuver");
  uint64_t v6 = [(MNGuidanceLaneInfo *)self lanes];

  if (v6)
  {
    v7 = [(MNGuidanceLaneInfo *)self lanes];
    [v14 encodeObject:v7 forKey:@"Lanes"];
  }
  v8 = [(MNGuidanceLaneInfo *)self titles];

  if (v8)
  {
    uint64_t v9 = [(MNGuidanceLaneInfo *)self titles];
    [v14 encodeObject:v9 forKey:@"Titles"];
  }
  v10 = [(MNGuidanceLaneInfo *)self instructions];

  if (v10)
  {
    uint64_t v11 = [(MNGuidanceLaneInfo *)self instructions];
    [v14 encodeObject:v11 forKey:@"Instructions"];
  }
  [v14 encodeObject:self->_primaryStrings forKey:@"_primaryStrings"];
  [v14 encodeObject:self->_secondaryStrings forKey:@"_secondaryStrings"];
  v12 = [(MNGuidanceLaneInfo *)self variableOverrides];

  if (v12)
  {
    v13 = [(MNGuidanceLaneInfo *)self variableOverrides];
    [v14 encodeObject:v13 forKey:@"VariableOverrides"];
  }
  objc_msgSend(v14, "encodeInteger:forKey:", -[MNGuidanceLaneInfo distanceDetailLevel](self, "distanceDetailLevel"), @"DistanceDetailLevel");
  objc_msgSend(v14, "encodeInt32:forKey:", -[MNGuidanceLaneInfo composedGuidanceEventIndex](self, "composedGuidanceEventIndex"), @"ComposedGuidanceEventIndex");
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (BOOL)isForManeuver
{
  return self->_isForManeuver;
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (NSDictionary)variableOverrides
{
  return self->_variableOverrides;
}

- (int64_t)distanceDetailLevel
{
  return self->_distanceDetailLevel;
}

- (int)composedGuidanceEventIndex
{
  return self->_composedGuidanceEventIndex;
}

- (NSArray)titles
{
  return self->_titles;
}

- (NSArray)instructions
{
  return self->_instructions;
}

- (NSArray)primaryStrings
{
  return self->_primaryStrings;
}

- (void)setPrimaryStrings:(id)a3
{
}

- (NSArray)secondaryStrings
{
  return self->_secondaryStrings;
}

- (void)setSecondaryStrings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryStrings, 0);
  objc_storeStrong((id *)&self->_primaryStrings, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_variableOverrides, 0);
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end