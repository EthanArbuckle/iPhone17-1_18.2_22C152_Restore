@interface _PSCNAutocompleteFeedback
+ (BOOL)supportsSecureCoding;
+ (id)createEnteredFeedbackWithBundleIdentifier:(id)a3 status:(int64_t)a4;
+ (id)createErasedHandleFeedbackWithBundleIdentifier:(id)a3 contact:(id)a4;
+ (id)createExitedFeedbackWithBundleIdentifier:(id)a3 status:(int64_t)a4;
+ (id)createTappedSuggestionFeedbackWithBundleIdentifier:(id)a3 suggestion:(id)a4;
+ (id)createTypedHandleFeedbackWithBundleIdentifier:(id)a3 contact:(id)a4 viaContactPicker:(BOOL)a5;
+ (id)createVendedSuggestionsFeedbackWithBundleIdentifier:(id)a3 suggestions:(id)a4;
+ (id)createVendedSuggestionsFeedbackWithBundleIdentifier:(id)a3 suggestions:(id)a4 isImplicit:(BOOL)a5;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BOOL)isImplicit;
- (NSDate)reportTime;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)sourceBundleIdentifier;
- (NSString)userIdentifier;
- (_PSCNAutocompleteFeedback)initWithBundleIdentifier:(id)a3 feedbackType:(int64_t)a4 isImplicit:(BOOL)a5 entered:(id)a6 exited:(id)a7 vendedSuggestions:(id)a8 tappedSuggestion:(id)a9 typedHandle:(id)a10 erasedHandle:(id)a11;
- (_PSCNAutocompleteFeedback)initWithCoder:(id)a3;
- (_PSCNAutocompleteFeedback)initWithDataVersion:(unsigned int)a3 reportTime:(id)a4 userIdentifier:(id)a5 bundleIdentifier:(id)a6 sourceBundleIdentifier:(id)a7 isImplicit:(BOOL)a8 feedbackType:(int64_t)a9 entered:(id)a10 exited:(id)a11 vendedSuggestions:(id)a12 tappedSuggestion:(id)a13 typedHandle:(id)a14 erasedHandle:(id)a15;
- (_PSCNAutocompleteFeedbackEntered)entered;
- (_PSCNAutocompleteFeedbackErasedHandle)erasedHandle;
- (_PSCNAutocompleteFeedbackExited)exited;
- (_PSCNAutocompleteFeedbackTappedSuggestion)tappedSuggestion;
- (_PSCNAutocompleteFeedbackTypedHandle)typedHandle;
- (_PSCNAutocompleteFeedbackVendedSuggestions)vendedSuggestions;
- (id)serialize;
- (int64_t)feedbackType;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)serialize;
- (void)setBundleIdentifier:(id)a3;
- (void)setDataVersion:(unsigned int)a3;
- (void)setEntered:(id)a3;
- (void)setErasedHandle:(id)a3;
- (void)setExited:(id)a3;
- (void)setFeedbackType:(int64_t)a3;
- (void)setIsImplicit:(BOOL)a3;
- (void)setReportTime:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setTappedSuggestion:(id)a3;
- (void)setTypedHandle:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setVendedSuggestions:(id)a3;
@end

@implementation _PSCNAutocompleteFeedback

- (_PSCNAutocompleteFeedback)initWithBundleIdentifier:(id)a3 feedbackType:(int64_t)a4 isImplicit:(BOOL)a5 entered:(id)a6 exited:(id)a7 vendedSuggestions:(id)a8 tappedSuggestion:(id)a9 typedHandle:(id)a10 erasedHandle:(id)a11
{
  BOOL v30 = a5;
  v15 = (void *)MEMORY[0x1E4F1C9C8];
  id v27 = a11;
  id v25 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v24 = a3;
  v26 = [v15 now];
  v20 = NSUserName();
  v21 = [MEMORY[0x1E4F28F80] processInfo];
  v22 = [v21 processName];
  v31 = [(_PSCNAutocompleteFeedback *)self initWithDataVersion:3 reportTime:v26 userIdentifier:v20 bundleIdentifier:v24 sourceBundleIdentifier:v22 isImplicit:v30 feedbackType:a4 entered:v19 exited:v18 vendedSuggestions:v17 tappedSuggestion:v16 typedHandle:v25 erasedHandle:v27];

  return v31;
}

- (_PSCNAutocompleteFeedback)initWithDataVersion:(unsigned int)a3 reportTime:(id)a4 userIdentifier:(id)a5 bundleIdentifier:(id)a6 sourceBundleIdentifier:(id)a7 isImplicit:(BOOL)a8 feedbackType:(int64_t)a9 entered:(id)a10 exited:(id)a11 vendedSuggestions:(id)a12 tappedSuggestion:(id)a13 typedHandle:(id)a14 erasedHandle:(id)a15
{
  id v18 = a4;
  id v37 = a5;
  id v27 = a6;
  id v36 = a6;
  id v35 = a7;
  id v34 = a10;
  id v33 = a11;
  id v32 = a12;
  id v31 = a13;
  id v30 = a14;
  id v19 = a15;
  v38.receiver = self;
  v38.super_class = (Class)_PSCNAutocompleteFeedback;
  v20 = [(_PSCNAutocompleteFeedback *)&v38 init];
  v21 = v20;
  if (v20)
  {
    v20->_dataVersion = a3;
    objc_storeStrong((id *)&v20->_userIdentifier, a5);
    objc_storeStrong((id *)&v21->_reportTime, a4);
    objc_storeStrong((id *)&v21->_bundleIdentifier, v27);
    objc_storeStrong((id *)&v21->_sourceBundleIdentifier, a7);
    v21->_isImplicit = a8;
    v21->_feedbackType = a9;
    switch(a9)
    {
      case 0:
        p_entered = (id *)&v21->_entered;
        id v23 = a10;
        goto LABEL_9;
      case 1:
        p_entered = (id *)&v21->_exited;
        id v23 = a11;
        goto LABEL_9;
      case 2:
        p_entered = (id *)&v21->_vendedSuggestions;
        id v23 = a12;
        goto LABEL_9;
      case 3:
        p_entered = (id *)&v21->_tappedSuggestion;
        id v23 = a13;
        goto LABEL_9;
      case 4:
        p_entered = (id *)&v21->_typedHandle;
        id v23 = a14;
        goto LABEL_9;
      case 5:
        p_entered = (id *)&v21->_erasedHandle;
        id v23 = a15;
LABEL_9:
        objc_storeStrong(p_entered, v23);
        break;
      default:
        v21->_feedbackType = 6;
        break;
    }
  }

  return v21;
}

- (_PSCNAutocompleteFeedback)initWithCoder:(id)a3
{
  id v3 = a3;
  unsigned int v18 = [v3 decodeInt32ForKey:@"dataVersion"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"reportTime"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentifier"];
  id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  id v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceBundleIdentifier"];
  unsigned int v15 = [v3 decodeBoolForKey:@"isImplicit"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"feedbackType"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entered"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"exited"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"vendedSuggestions"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"tappedSuggestion"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"typedHandle"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"erasedHandle"];

  id v19 = [(_PSCNAutocompleteFeedback *)self initWithDataVersion:v18 reportTime:v4 userIdentifier:v5 bundleIdentifier:v17 sourceBundleIdentifier:v16 isImplicit:v15 feedbackType:v6 entered:v7 exited:v8 vendedSuggestions:v9 tappedSuggestion:v10 typedHandle:v11 erasedHandle:v12];
  return v19;
}

- (NSString)description
{
  id v3 = [(_PSCNAutocompleteFeedback *)self entered];

  unint64_t v4 = 0x1E4F29000uLL;
  if (v3)
  {
    v5 = [(_PSCNAutocompleteFeedback *)self entered];
    uint64_t v6 = [v5 enterStatus];

    if (v6)
    {
      v7 = [(_PSCNAutocompleteFeedback *)self entered];
      uint64_t v8 = [v7 enterStatus];

      if (v8 == 1) {
        v9 = @"\nenterStatus: Resumed";
      }
      else {
        v9 = @"\nenterStatus: Unknown";
      }
    }
    else
    {
      v9 = @"\nenterStatus: Started";
    }
    unsigned int v15 = @"entered";
  }
  else
  {
    v10 = [(_PSCNAutocompleteFeedback *)self exited];

    if (v10)
    {
      v11 = [(_PSCNAutocompleteFeedback *)self exited];
      uint64_t v12 = [v11 exitStatus];

      if (v12)
      {
        v13 = [(_PSCNAutocompleteFeedback *)self exited];
        uint64_t v14 = [v13 exitStatus];

        if (v14 == 1) {
          v9 = @"\nexitStatus: Paused";
        }
        else {
          v9 = @"\nexitStatus: Unknown";
        }
      }
      else
      {
        v9 = @"\nexitStatus: Finished";
      }
      unsigned int v15 = @"exited";
    }
    else
    {
      id v16 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];

      if (v16)
      {
        v65 = NSString;
        v82 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];
        v80 = [v82 suggestions];
        v78 = [v80 firstObject];
        v86 = [v78 trialID];
        v76 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];
        v74 = [v76 suggestions];
        uint64_t v61 = [v74 count];
        v72 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];
        v71 = [v72 suggestions];
        v70 = [v71 firstObject];
        v84 = [v70 groupName];
        v69 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];
        v68 = [v69 suggestions];
        v67 = [v68 firstObject];
        v66 = [v67 recipients];
        uint64_t v56 = [v66 count];
        v64 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];
        v63 = [v64 suggestions];
        v62 = [v63 firstObject];
        v60 = [v62 recipients];
        v53 = [v60 description];
        v59 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];
        v58 = [v59 suggestions];
        v57 = [v58 lastObject];
        v52 = [v57 groupName];
        v55 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];
        v54 = [v55 suggestions];
        id v17 = [v54 lastObject];
        unsigned int v18 = [v17 recipients];
        uint64_t v19 = [v18 count];
        v20 = [(_PSCNAutocompleteFeedback *)self vendedSuggestions];
        v21 = [v20 suggestions];
        v22 = [v21 lastObject];
        id v23 = [v22 recipients];
        id v24 = [v23 description];
        v9 = [v65 stringWithFormat:@"\ntrialID: %@ \ncountSuggestions: %lu \nfirstSuggestionGroupName: %@ \nfirstSuggestionCountRecipients: %lu \nfirstSuggestionRecipients: %@ \nlastSuggestionGroupName: %@ \nlastSuggestionCountRecipients: %lu \nlastSuggestionRecipients: %@", v86, v61, v84, v56, v53, v52, v19, v24];

        unint64_t v4 = 0x1E4F29000;
        unsigned int v15 = @"vendedSuggestions";
      }
      else
      {
        id v32 = [(_PSCNAutocompleteFeedback *)self tappedSuggestion];

        if (v32)
        {
          v79 = NSString;
          v87 = [(_PSCNAutocompleteFeedback *)self tappedSuggestion];
          v85 = [v87 suggestion];
          v75 = [v85 trialID];
          v83 = [(_PSCNAutocompleteFeedback *)self tappedSuggestion];
          v81 = [v83 suggestion];
          v73 = [v81 groupName];
          v77 = [(_PSCNAutocompleteFeedback *)self tappedSuggestion];
          id v33 = [v77 suggestion];
          id v34 = [v33 recipients];
          uint64_t v35 = [v34 count];
          id v36 = [(_PSCNAutocompleteFeedback *)self tappedSuggestion];
          id v37 = [v36 suggestion];
          objc_super v38 = [v37 recipients];
          v39 = [v38 description];
          v9 = [v79 stringWithFormat:@"\ntrialID: %@ \ngroupName: %@ \ncountRecipients:%lu \nrecipients: %@", v75, v73, v35, v39];

          unint64_t v4 = 0x1E4F29000;
          unsigned int v15 = @"tappedSuggestion";
        }
        else
        {
          v40 = [(_PSCNAutocompleteFeedback *)self typedHandle];

          if (v40)
          {
            v41 = NSString;
            v42 = [(_PSCNAutocompleteFeedback *)self typedHandle];
            if ([v42 viaContactPicker]) {
              v43 = @"YES";
            }
            else {
              v43 = @"NO";
            }
            v44 = [(_PSCNAutocompleteFeedback *)self typedHandle];
            v45 = [v44 contact];
            v46 = [v45 description];
            v9 = [v41 stringWithFormat:@"\nviaContactPicker: %@\ncontact: %@", v43, v46];

            unsigned int v15 = @"typedHandle";
          }
          else
          {
            v47 = [(_PSCNAutocompleteFeedback *)self erasedHandle];

            if (v47)
            {
              v48 = NSString;
              v49 = [(_PSCNAutocompleteFeedback *)self erasedHandle];
              v50 = [v49 contact];
              v51 = [v50 description];
              v9 = [v48 stringWithFormat:@"\ncontact: %@", v51];

              unsigned int v15 = @"erasedHandle";
            }
            else
            {
              v9 = &stru_1EF653EA8;
              unsigned int v15 = @"unknown";
            }
          }
        }
      }
    }
  }
  id v25 = *(void **)(v4 + 24);
  uint64_t v26 = objc_opt_class();
  id v27 = [(_PSCNAutocompleteFeedback *)self reportTime];
  v28 = [(_PSCNAutocompleteFeedback *)self bundleIdentifier];
  if ([(_PSCNAutocompleteFeedback *)self isImplicit]) {
    v29 = @"YES";
  }
  else {
    v29 = @"NO";
  }
  id v30 = [v25 stringWithFormat:@"<%@ %p>\nreportTime: %@\nbundleId: %@\nisImplicit: %@\nfeedbackType: %@%@", v26, self, v27, v28, v29, v15, v9];

  return (NSString *)v30;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t dataVersion = self->_dataVersion;
  id v5 = a3;
  [v5 encodeInt32:dataVersion forKey:@"dataVersion"];
  [v5 encodeObject:self->_reportTime forKey:@"reportTime"];
  [v5 encodeObject:self->_userIdentifier forKey:@"userIdentifier"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_sourceBundleIdentifier forKey:@"sourceBundleIdentifier"];
  [v5 encodeBool:self->_isImplicit forKey:@"isImplicit"];
  [v5 encodeInteger:self->_feedbackType forKey:@"feedbackType"];
  [v5 encodeObject:self->_entered forKey:@"entered"];
  [v5 encodeObject:self->_exited forKey:@"exited"];
  [v5 encodeObject:self->_vendedSuggestions forKey:@"vendedSuggestions"];
  [v5 encodeObject:self->_tappedSuggestion forKey:@"tappedSuggestion"];
  [v5 encodeObject:self->_typedHandle forKey:@"typedHandle"];
  [v5 encodeObject:self->_erasedHandle forKey:@"erasedHandle"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  unint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v11 = 0;
  uint64_t v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];

  id v7 = v11;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_PSCNAutocompleteFeedback eventWithData:dataVersion:]((uint64_t)v7, v9);
    }
  }

  return v6;
}

- (id)serialize
{
  id v7 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v3 = v7;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_PSCNAutocompleteFeedback *)(uint64_t)v3 serialize];
    }
  }

  return v2;
}

+ (id)createEnteredFeedbackWithBundleIdentifier:(id)a3 status:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  id v8 = [[_PSCNAutocompleteFeedbackEntered alloc] initWithEnterStatus:a4];
  v9 = (void *)[v7 initWithBundleIdentifier:v6 feedbackType:0 isImplicit:0 entered:v8 exited:0 vendedSuggestions:0 tappedSuggestion:0 typedHandle:0 erasedHandle:0];

  return v9;
}

+ (id)createExitedFeedbackWithBundleIdentifier:(id)a3 status:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  id v8 = [[_PSCNAutocompleteFeedbackExited alloc] initWithExitStatus:a4];
  v9 = (void *)[v7 initWithBundleIdentifier:v6 feedbackType:1 isImplicit:0 entered:0 exited:v8 vendedSuggestions:0 tappedSuggestion:0 typedHandle:0 erasedHandle:0];

  return v9;
}

+ (id)createVendedSuggestionsFeedbackWithBundleIdentifier:(id)a3 suggestions:(id)a4 isImplicit:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  id v11 = [[_PSCNAutocompleteFeedbackVendedSuggestions alloc] initWithSuggestions:v8];

  uint64_t v12 = (void *)[v10 initWithBundleIdentifier:v9 feedbackType:2 isImplicit:v5 entered:0 exited:0 vendedSuggestions:v11 tappedSuggestion:0 typedHandle:0 erasedHandle:0];

  return v12;
}

+ (id)createVendedSuggestionsFeedbackWithBundleIdentifier:(id)a3 suggestions:(id)a4
{
  return (id)[a1 createVendedSuggestionsFeedbackWithBundleIdentifier:a3 suggestions:a4 isImplicit:0];
}

+ (id)createTappedSuggestionFeedbackWithBundleIdentifier:(id)a3 suggestion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = [[_PSCNAutocompleteFeedbackTappedSuggestion alloc] initWithSuggestion:v6];

  id v10 = (void *)[v8 initWithBundleIdentifier:v7 feedbackType:3 isImplicit:0 entered:0 exited:0 vendedSuggestions:0 tappedSuggestion:v9 typedHandle:0 erasedHandle:0];

  return v10;
}

+ (id)createTypedHandleFeedbackWithBundleIdentifier:(id)a3 contact:(id)a4 viaContactPicker:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  id v11 = [[_PSCNAutocompleteFeedbackTypedHandle alloc] initWithContact:v8 viaContactPicker:v5];

  uint64_t v12 = (void *)[v10 initWithBundleIdentifier:v9 feedbackType:4 isImplicit:0 entered:0 exited:0 vendedSuggestions:0 tappedSuggestion:0 typedHandle:v11 erasedHandle:0];

  return v12;
}

+ (id)createErasedHandleFeedbackWithBundleIdentifier:(id)a3 contact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v9 = [[_PSCNAutocompleteFeedbackErasedHandle alloc] initWithContact:v6];

  id v10 = (void *)[v8 initWithBundleIdentifier:v7 feedbackType:5 isImplicit:0 entered:0 exited:0 vendedSuggestions:0 tappedSuggestion:0 typedHandle:0 erasedHandle:v9];

  return v10;
}

- (int64_t)feedbackType
{
  return self->_feedbackType;
}

- (void)setFeedbackType:(int64_t)a3
{
  self->_feedbackType = a3;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(unsigned int)a3
{
  self->_uint64_t dataVersion = a3;
}

- (NSDate)reportTime
{
  return self->_reportTime;
}

- (void)setReportTime:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (BOOL)isImplicit
{
  return self->_isImplicit;
}

- (void)setIsImplicit:(BOOL)a3
{
  self->_isImplicit = a3;
}

- (_PSCNAutocompleteFeedbackEntered)entered
{
  return self->_entered;
}

- (void)setEntered:(id)a3
{
}

- (_PSCNAutocompleteFeedbackExited)exited
{
  return self->_exited;
}

- (void)setExited:(id)a3
{
}

- (_PSCNAutocompleteFeedbackVendedSuggestions)vendedSuggestions
{
  return self->_vendedSuggestions;
}

- (void)setVendedSuggestions:(id)a3
{
}

- (_PSCNAutocompleteFeedbackTappedSuggestion)tappedSuggestion
{
  return self->_tappedSuggestion;
}

- (void)setTappedSuggestion:(id)a3
{
}

- (_PSCNAutocompleteFeedbackTypedHandle)typedHandle
{
  return self->_typedHandle;
}

- (void)setTypedHandle:(id)a3
{
}

- (_PSCNAutocompleteFeedbackErasedHandle)erasedHandle
{
  return self->_erasedHandle;
}

- (void)setErasedHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_erasedHandle, 0);
  objc_storeStrong((id *)&self->_typedHandle, 0);
  objc_storeStrong((id *)&self->_tappedSuggestion, 0);
  objc_storeStrong((id *)&self->_vendedSuggestions, 0);
  objc_storeStrong((id *)&self->_exited, 0);
  objc_storeStrong((id *)&self->_entered, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);

  objc_storeStrong((id *)&self->_reportTime, 0);
}

+ (void)eventWithData:(uint64_t)a1 dataVersion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedback: ERROR unarchiving Biome event: %@", (uint8_t *)&v2, 0xCu);
}

- (void)serialize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedback: ERROR serializing Biome event: %@", (uint8_t *)&v2, 0xCu);
}

@end