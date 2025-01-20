@interface PKPaymentPassContent
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsTransitOnly;
- (NSArray)actionGroups;
- (NSArray)availableActions;
- (NSArray)transitCommutePlans;
- (NSArray)upgradeRequests;
- (NSDictionary)actionLocalizations;
- (NSDictionary)localizedSuspendedReasonsByAID;
- (NSString)appURLScheme;
- (NSString)cobrandName;
- (NSString)customerServiceIdentifier;
- (NSString)messagePushTopic;
- (NSString)shippingAddressSeed;
- (NSString)speakableMake;
- (NSString)speakableModel;
- (NSString)transactionPushTopic;
- (NSURL)messageServiceRegistrationURL;
- (NSURL)messageServiceURL;
- (NSURL)transactionServiceRegistrationURL;
- (NSURL)transactionServiceURL;
- (PKDynamicLayerConfiguration)dynamicLayerConfiguration;
- (PKPassAuxiliaryRegistrationRequirements)auxiliaryRegistrationRequirements;
- (PKPaymentPassContent)initWithCoder:(id)a3;
- (PKPaymentPassContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6;
- (PKSiriIntentsConfiguration)supportedSiriIntents;
- (int64_t)accessType;
- (int64_t)identityType;
- (int64_t)paymentType;
- (unint64_t)transitCommutePlanType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessType:(int64_t)a3;
- (void)setActionGroups:(id)a3;
- (void)setActionLocalizations:(id)a3;
- (void)setAppURLScheme:(id)a3;
- (void)setAuxiliaryRegistrationRequirements:(id)a3;
- (void)setAvailableActions:(id)a3;
- (void)setCobrandName:(id)a3;
- (void)setCustomerServiceIdentifier:(id)a3;
- (void)setDynamicLayerConfiguration:(id)a3;
- (void)setIdentityType:(int64_t)a3;
- (void)setLocalizedSuspendedReasonsByAID:(id)a3;
- (void)setMessagePushTopic:(id)a3;
- (void)setMessageServiceRegistrationURL:(id)a3;
- (void)setMessageServiceURL:(id)a3;
- (void)setPaymentType:(int64_t)a3;
- (void)setShippingAddressSeed:(id)a3;
- (void)setSpeakableMake:(id)a3;
- (void)setSpeakableModel:(id)a3;
- (void)setSupportedSiriIntents:(id)a3;
- (void)setSupportsTransitOnly:(BOOL)a3;
- (void)setTransactionPushTopic:(id)a3;
- (void)setTransactionServiceRegistrationURL:(id)a3;
- (void)setTransactionServiceURL:(id)a3;
- (void)setTransitCommutePlanType:(unint64_t)a3;
- (void)setTransitCommutePlans:(id)a3;
- (void)setUpgradeRequests:(id)a3;
@end

@implementation PKPaymentPassContent

- (PKDynamicLayerConfiguration)dynamicLayerConfiguration
{
  return self->_dynamicLayerConfiguration;
}

- (NSString)customerServiceIdentifier
{
  return self->_customerServiceIdentifier;
}

- (PKPaymentPassContent)initWithDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v153.receiver = self;
  v153.super_class = (Class)PKPaymentPassContent;
  id v136 = a5;
  v12 = -[PKPassContent initWithDictionary:bundle:privateBundle:passType:](&v153, sel_initWithDictionary_bundle_privateBundle_passType_, v10, v11);
  v13 = v12;
  if (v12)
  {
    [(PKPassContent *)v12 setLogoText:0];
    v14 = [v10 PKStringForKey:@"cobrandName"];
    [(PKPaymentPassContent *)v13 setCobrandName:v14];

    v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = [v10 PKStringForKey:@"transactionServiceURL"];
    v17 = [v15 URLWithString:v16];
    [(PKPaymentPassContent *)v13 setTransactionServiceURL:v17];

    v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = [v10 PKStringForKey:@"transactionServiceRegistrationURL"];
    v20 = [v18 URLWithString:v19];
    [(PKPaymentPassContent *)v13 setTransactionServiceRegistrationURL:v20];

    v21 = [v10 PKStringForKey:@"transactionPushTopic"];
    [(PKPaymentPassContent *)v13 setTransactionPushTopic:v21];

    v22 = (void *)MEMORY[0x1E4F1CB10];
    v23 = [v10 PKStringForKey:@"messageServiceURL"];
    v24 = [v22 URLWithString:v23];
    [(PKPaymentPassContent *)v13 setMessageServiceURL:v24];

    v25 = (void *)MEMORY[0x1E4F1CB10];
    v26 = [v10 PKStringForKey:@"messageServiceRegistrationURL"];
    v27 = [v25 URLWithString:v26];
    [(PKPaymentPassContent *)v13 setMessageServiceRegistrationURL:v27];

    v28 = [v10 PKStringForKey:@"messagePushTopic"];
    [(PKPaymentPassContent *)v13 setMessagePushTopic:v28];

    v29 = [v10 PKStringForKey:@"appLaunchURLScheme"];
    [(PKPaymentPassContent *)v13 setAppURLScheme:v29];

    v30 = [v10 PKStringForKey:@"customerServiceIdentifier"];
    [(PKPaymentPassContent *)v13 setCustomerServiceIdentifier:v30];

    v31 = [v10 PKStringForKey:@"shippingAddressSeed"];
    [(PKPaymentPassContent *)v13 setShippingAddressSeed:v31];

    v32 = [v10 PKStringForKey:@"speakableCarMake"];
    [(PKPaymentPassContent *)v13 setSpeakableMake:v32];

    v33 = [v10 PKStringForKey:@"speakableCarModel"];
    [(PKPaymentPassContent *)v13 setSpeakableModel:v33];

    uint64_t v34 = [v10 PKDictionaryForKey:@"supportedSiriIntents"];
    if (v34)
    {
      v35 = [[PKSiriIntentsConfiguration alloc] initWithDictionary:v34];
      [(PKPaymentPassContent *)v13 setSupportedSiriIntents:v35];
    }
    v127 = (void *)v34;
    v130 = v13;
    v134 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v36 = [v10 PKArrayContaining:objc_opt_class() forKey:@"paymentApplications"];
    v37 = (void *)v36;
    v38 = (void *)MEMORY[0x1E4F1CBF0];
    if (v36) {
      v39 = (void *)v36;
    }
    else {
      v39 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v40 = v39;

    v129 = v10;
    uint64_t v41 = [v10 PKArrayContaining:objc_opt_class() forKey:@"auxiliaryPaymentApplications"];
    v42 = (void *)v41;
    if (v41) {
      v43 = (void *)v41;
    }
    else {
      v43 = v38;
    }
    id v44 = v43;

    v125 = v44;
    v126 = v40;
    [v40 arrayByAddingObjectsFromArray:v44];
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = [obj countByEnumeratingWithState:&v149 objects:v157 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v150;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v150 != v47) {
            objc_enumerationMutation(obj);
          }
          v49 = *(void **)(*((void *)&v149 + 1) + 8 * i);
          v50 = [v49 PKStringForKey:@"applicationIdentifier"];
          v51 = [v49 PKStringForKey:@"suspendedReason"];
          uint64_t v52 = PKLocalizedPassStringForPassBundle(v51, v11, v136);
          v53 = (void *)v52;
          if (v50) {
            BOOL v54 = v52 == 0;
          }
          else {
            BOOL v54 = 1;
          }
          if (!v54) {
            [v134 setObject:v52 forKey:v50];
          }
        }
        uint64_t v46 = [obj countByEnumeratingWithState:&v149 objects:v157 count:16];
      }
      while (v46);
    }
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v134];
    [(PKPaymentPassContent *)v130 setLocalizedSuspendedReasonsByAID:v55];

    id v10 = v129;
    v56 = [v129 PKDictionaryForKey:@"transitCard"];
    v57 = v56;
    if (v56) {
      -[PKPaymentPassContent setSupportsTransitOnly:](v130, "setSupportsTransitOnly:", [v56 PKBoolForKey:@"showTransitOnly"]);
    }
    v124 = v57;
    v58 = [PKTransitCommutePlanPackage alloc];
    v59 = [(PKPassContent *)v130 backFieldBuckets];
    v60 = [(PKTransitCommutePlanPackage *)v58 initWithDictionary:v129 backFieldBuckets:v59 bundle:v11 privateBundle:v136 passType:a6];

    v61 = [(PKTransitCommutePlanPackage *)v60 transitCommutePlans];
    v62 = (void *)[v61 copy];
    [(PKPaymentPassContent *)v130 setTransitCommutePlans:v62];

    v131 = v60;
    [(PKPaymentPassContent *)v130 setTransitCommutePlanType:[(PKTransitCommutePlanPackage *)v60 transitCommutePlanType]];
    v123 = [v11 pathForResource:@"actions" ofType:@"strings"];
    v63 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfFile:");
    [(PKPaymentPassContent *)v130 setActionLocalizations:v63];
    id v128 = v11;
    v64 = [v11 bundleURL];
    v65 = PKPaymentPassActionsDictionaryWithError(v64, 0);

    v122 = v65;
    if (v65 && [v65 count])
    {
      v66 = [v65 objectForKey:@"actionGroups"];
      v67 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v66, "count"));
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v68 = v66;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v145 objects:v156 count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = *(void *)v146;
        do
        {
          for (uint64_t j = 0; j != v70; ++j)
          {
            if (*(void *)v146 != v71) {
              objc_enumerationMutation(v68);
            }
            v73 = [[PKPaymentPassActionGroup alloc] initWithDictionary:*(void *)(*((void *)&v145 + 1) + 8 * j) localizations:v63];
            [v67 safelyAddObject:v73];
          }
          uint64_t v70 = [v68 countByEnumeratingWithState:&v145 objects:v156 count:16];
        }
        while (v70);
      }
      v120 = v68;

      v121 = v67;
      v74 = (void *)[v67 copy];
      [(PKPaymentPassContent *)v130 setActionGroups:v74];

      v75 = [v65 objectForKey:@"actions"];
      v133 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v75, "count"));
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      id v132 = v75;
      uint64_t v76 = [v132 countByEnumeratingWithState:&v141 objects:v155 count:16];
      if (v76)
      {
        uint64_t v77 = v76;
        uint64_t v78 = *(void *)v142;
        do
        {
          for (uint64_t k = 0; k != v77; ++k)
          {
            if (*(void *)v142 != v78) {
              objc_enumerationMutation(v132);
            }
            v80 = [[PKPaymentPassAction alloc] initWithDictionary:*(void *)(*((void *)&v141 + 1) + 8 * k) localizations:v63];
            v81 = v80;
            if (v80)
            {
              v82 = v63;
              v83 = [(PKPaymentPassAction *)v80 associatedPlanIdentifier];
              v84 = v83;
              if (v83)
              {
                v85 = v83;
              }
              else
              {
                v85 = [(PKPaymentPassAction *)v81 relevantPropertyIdentifier];
              }
              v86 = v85;

              if (v86) {
                v87 = v86;
              }
              else {
                v87 = @"commute_plan";
              }
              v88 = v87;

              if (v88)
              {
                v89 = [(PKTransitCommutePlanPackage *)v131 planForIdentifier:v88];
                v90 = (void *)[v89 copy];

                if (v90)
                {
                  [(PKPaymentPassAction *)v81 setAssociatedPlanIdentifier:v88];
                  [(PKPaymentPassAction *)v81 setAssociatedPlan:v90];
                }
              }
              [v133 addObject:v81];

              v63 = v82;
            }
          }
          uint64_t v77 = [v132 countByEnumeratingWithState:&v141 objects:v155 count:16];
        }
        while (v77);
      }

      [(PKPaymentPassContent *)v130 setAvailableActions:v133];
      id v10 = v129;
    }
    uint64_t v91 = [v10 PKArrayContaining:objc_opt_class() forKey:@"passUpgrades"];
    v92 = (void *)v91;
    v93 = (void *)MEMORY[0x1E4F1CBF0];
    if (v91) {
      v93 = (void *)v91;
    }
    id v94 = v93;

    id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v96 = v94;
    uint64_t v97 = [v96 countByEnumeratingWithState:&v137 objects:v154 count:16];
    if (v97)
    {
      uint64_t v98 = v97;
      uint64_t v99 = *(void *)v138;
      do
      {
        for (uint64_t m = 0; m != v98; ++m)
        {
          if (*(void *)v138 != v99) {
            objc_enumerationMutation(v96);
          }
          v101 = +[PKPassUpgradeRequest passUpgradeRequestFromDictionary:*(void *)(*((void *)&v137 + 1) + 8 * m)];
          if (v101) {
            [v95 addObject:v101];
          }
        }
        uint64_t v98 = [v96 countByEnumeratingWithState:&v137 objects:v154 count:16];
      }
      while (v98);
    }

    uint64_t v102 = [v95 copy];
    v13 = v130;
    upgradeRequests = v130->_upgradeRequests;
    v130->_upgradeRequests = (NSArray *)v102;

    v104 = [v10 PKDictionaryForKey:@"auxiliaryCapabilities"];
    v105 = v104;
    if (v104)
    {
      id v106 = v104;
    }
    else
    {
      id v106 = [v10 PKDictionaryForKey:@"auxiliaryRegistrationRequirements"];
    }
    v107 = v106;

    v108 = [[PKPassAuxiliaryRegistrationRequirements alloc] initWithDictionary:v107];
    auxiliaryRegistrationRequirements = v130->_auxiliaryRegistrationRequirements;
    v130->_auxiliaryRegistrationRequirements = v108;

    v110 = [v10 PKDictionaryForKey:@"dynamicLayerConfiguration"];
    if (v110)
    {
      v111 = [[PKDynamicLayerConfiguration alloc] initWithDictionary:v110];
      dynamicLayerConfiguration = v130->_dynamicLayerConfiguration;
      v130->_dynamicLayerConfiguration = v111;
    }
    v113 = [v10 PKStringForKey:@"cardType"];
    uint64_t v114 = PKPaymentCardTypeFromString(v113);

    if (v114 == 4)
    {
      v116 = [v10 PKStringForKey:@"cardSubtype"];
      uint64_t v117 = PKSecureElementIdentityPassTypeFromString(v116);
      v118 = &OBJC_IVAR___PKPaymentPassContent__identityType;
      v115 = v127;
    }
    else
    {
      v115 = v127;
      if (v114 == 3)
      {
        v116 = [v10 PKStringForKey:@"cardSubtype"];
        uint64_t v117 = PKSecureElementAccessPassTypeFromString(v116);
        v118 = &OBJC_IVAR___PKPaymentPassContent__accessType;
      }
      else
      {
        if (v114 != 1)
        {
LABEL_76:

          id v11 = v128;
          goto LABEL_77;
        }
        v116 = [v10 PKStringForKey:@"cardSubtype"];
        uint64_t v117 = PKSecureElementPaymentPassTypeFromString(v116);
        v118 = &OBJC_IVAR___PKPaymentPassContent__paymentType;
      }
    }
    *(Class *)((char *)&v130->super.super.super.isa + *v118) = (Class)v117;

    goto LABEL_76;
  }
LABEL_77:

  return v13;
}

- (void)setTransitCommutePlans:(id)a3
{
}

- (void)setTransitCommutePlanType:(unint64_t)a3
{
  self->_transitCommutePlanType = a3;
}

- (void)setTransactionServiceURL:(id)a3
{
}

- (void)setTransactionServiceRegistrationURL:(id)a3
{
}

- (void)setTransactionPushTopic:(id)a3
{
}

- (void)setSpeakableModel:(id)a3
{
}

- (void)setSpeakableMake:(id)a3
{
}

- (void)setShippingAddressSeed:(id)a3
{
}

- (void)setMessageServiceURL:(id)a3
{
}

- (void)setMessageServiceRegistrationURL:(id)a3
{
}

- (void)setMessagePushTopic:(id)a3
{
}

- (void)setLocalizedSuspendedReasonsByAID:(id)a3
{
}

- (void)setCustomerServiceIdentifier:(id)a3
{
}

- (void)setCobrandName:(id)a3
{
}

- (void)setAppURLScheme:(id)a3
{
}

- (void)setActionLocalizations:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentPassContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x192FDC630]();
  v74.receiver = self;
  v74.super_class = (Class)PKPaymentPassContent;
  v6 = [(PKPassContent *)&v74 initWithCoder:v4];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cobrandName"];
    cobrandName = v6->_cobrandName;
    v6->_cobrandName = (NSString *)v7;

    v73 = v5;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionServiceURL"];
    transactionServiceURL = v6->_transactionServiceURL;
    v6->_transactionServiceURL = (NSURL *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionServiceRegistrationURL"];
    transactionServiceRegistrationURL = v6->_transactionServiceRegistrationURL;
    v6->_transactionServiceRegistrationURL = (NSURL *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionPushTopic"];
    transactionPushTopic = v6->_transactionPushTopic;
    v6->_transactionPushTopic = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageServiceURL"];
    messageServiceURL = v6->_messageServiceURL;
    v6->_messageServiceURL = (NSURL *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageServiceRegistrationURL"];
    messageServiceRegistrationURL = v6->_messageServiceRegistrationURL;
    v6->_messageServiceRegistrationURL = (NSURL *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messagePushTopic"];
    messagePushTopic = v6->_messagePushTopic;
    v6->_messagePushTopic = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLaunchURLScheme"];
    appURLScheme = v6->_appURLScheme;
    v6->_appURLScheme = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customerServiceIdentifier"];
    customerServiceIdentifier = v6->_customerServiceIdentifier;
    v6->_customerServiceIdentifier = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingAddressSeed"];
    shippingAddressSeed = v6->_shippingAddressSeed;
    v6->_shippingAddressSeed = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speakableCarMake"];
    speakableMake = v6->_speakableMake;
    v6->_speakableMake = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"speakableCarModel"];
    speakableModel = v6->_speakableModel;
    v6->_speakableModel = (NSString *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    v72 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v72 forKey:@"suspendedReason"];
    localizedSuspendedReasonsByAID = v6->_localizedSuspendedReasonsByAID;
    v6->_localizedSuspendedReasonsByAID = (NSDictionary *)v33;

    v6->_supportsTransitOnly = [v4 decodeBoolForKey:@"showTransitOnly"];
    v6->_transitCommutePlanType = [v4 decodeIntegerForKey:@"commutePlanPassContentType"];
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    id v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"actionLocalizations"];
    actionLocalizations = v6->_actionLocalizations;
    v6->_actionLocalizations = (NSDictionary *)v41;

    uint64_t v43 = [v4 decodeObjectOfClasses:v37 forKey:@"actions"];
    availableActions = v6->_availableActions;
    v6->_availableActions = (NSArray *)v43;

    uint64_t v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"transitCommutePlans"];
    transitCommutePlans = v6->_transitCommutePlans;
    v6->_transitCommutePlans = (NSArray *)v48;

    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    uint64_t v53 = [v4 decodeObjectOfClasses:v52 forKey:@"actionGroups"];
    actionGroups = v6->_actionGroups;
    v6->_actionGroups = (NSArray *)v53;

    v55 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    v59 = objc_msgSend(v55, "setWithObjects:", v56, v57, v58, objc_opt_class(), 0);
    uint64_t v60 = [v4 decodeObjectOfClasses:v59 forKey:@"passUpgrades"];
    upgradeRequests = v6->_upgradeRequests;
    v6->_upgradeRequests = (NSArray *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportedSiriIntents"];
    supportedSiriIntents = v6->_supportedSiriIntents;
    v6->_supportedSiriIntents = (PKSiriIntentsConfiguration *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auxiliaryRegistrationRequirements"];
    auxiliaryRegistrationRequirements = v6->_auxiliaryRegistrationRequirements;
    v6->_auxiliaryRegistrationRequirements = (PKPassAuxiliaryRegistrationRequirements *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dynamicLayerConfiguration"];
    dynamicLayerConfiguration = v6->_dynamicLayerConfiguration;
    v6->_dynamicLayerConfiguration = (PKDynamicLayerConfiguration *)v66;

    id v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identityType"];
    v6->_identityType = PKSecureElementIdentityPassTypeFromString(v68);

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessType"];
    v6->_accessType = PKSecureElementAccessPassTypeFromString(v69);

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentType"];
    v6->_paymentType = PKSecureElementPaymentPassTypeFromString(v70);

    v5 = v73;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPassContent;
  id v4 = a3;
  [(PKPassContent *)&v8 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_cobrandName, @"cobrandName", v8.receiver, v8.super_class);
  [v4 encodeObject:self->_transactionServiceURL forKey:@"transactionServiceURL"];
  [v4 encodeObject:self->_transactionServiceRegistrationURL forKey:@"transactionServiceRegistrationURL"];
  [v4 encodeObject:self->_transactionPushTopic forKey:@"transactionPushTopic"];
  [v4 encodeObject:self->_messageServiceURL forKey:@"messageServiceURL"];
  [v4 encodeObject:self->_messageServiceRegistrationURL forKey:@"messageServiceRegistrationURL"];
  [v4 encodeObject:self->_messagePushTopic forKey:@"messagePushTopic"];
  [v4 encodeObject:self->_appURLScheme forKey:@"appLaunchURLScheme"];
  [v4 encodeObject:self->_customerServiceIdentifier forKey:@"customerServiceIdentifier"];
  [v4 encodeObject:self->_shippingAddressSeed forKey:@"shippingAddressSeed"];
  [v4 encodeObject:self->_speakableMake forKey:@"speakableCarMake"];
  [v4 encodeObject:self->_speakableModel forKey:@"speakableCarModel"];
  [v4 encodeObject:self->_localizedSuspendedReasonsByAID forKey:@"suspendedReason"];
  [v4 encodeBool:self->_supportsTransitOnly forKey:@"showTransitOnly"];
  [v4 encodeInteger:self->_transitCommutePlanType forKey:@"commutePlanPassContentType"];
  [v4 encodeObject:self->_availableActions forKey:@"actions"];
  [v4 encodeObject:self->_actionGroups forKey:@"actionGroups"];
  [v4 encodeObject:self->_transitCommutePlans forKey:@"transitCommutePlans"];
  [v4 encodeObject:self->_upgradeRequests forKey:@"passUpgrades"];
  [v4 encodeObject:self->_actionLocalizations forKey:@"actionLocalizations"];
  [v4 encodeObject:self->_auxiliaryRegistrationRequirements forKey:@"auxiliaryRegistrationRequirements"];
  [v4 encodeObject:self->_dynamicLayerConfiguration forKey:@"dynamicLayerConfiguration"];
  v5 = PKSecureElementIdentityPassTypeToString(self->_identityType);
  [v4 encodeObject:v5 forKey:@"identityType"];

  v6 = PKSecureElementAccessPassTypeToString(self->_accessType);
  [v4 encodeObject:v6 forKey:@"accessType"];

  uint64_t v7 = PKSecureElementPaymentPassTypeToString(self->_paymentType);
  [v4 encodeObject:v7 forKey:@"paymentType"];

  [v4 encodeObject:self->_supportedSiriIntents forKey:@"supportedSiriIntents"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicLayerConfiguration, 0);
  objc_storeStrong((id *)&self->_auxiliaryRegistrationRequirements, 0);
  objc_storeStrong((id *)&self->_supportedSiriIntents, 0);
  objc_storeStrong((id *)&self->_speakableModel, 0);
  objc_storeStrong((id *)&self->_speakableMake, 0);
  objc_storeStrong((id *)&self->_shippingAddressSeed, 0);
  objc_storeStrong((id *)&self->_upgradeRequests, 0);
  objc_storeStrong((id *)&self->_transitCommutePlans, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_actionLocalizations, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_localizedSuspendedReasonsByAID, 0);
  objc_storeStrong((id *)&self->_customerServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_appURLScheme, 0);
  objc_storeStrong((id *)&self->_messagePushTopic, 0);
  objc_storeStrong((id *)&self->_messageServiceRegistrationURL, 0);
  objc_storeStrong((id *)&self->_messageServiceURL, 0);
  objc_storeStrong((id *)&self->_transactionPushTopic, 0);
  objc_storeStrong((id *)&self->_transactionServiceRegistrationURL, 0);
  objc_storeStrong((id *)&self->_transactionServiceURL, 0);
  objc_storeStrong((id *)&self->_cobrandName, 0);
}

- (NSString)cobrandName
{
  return self->_cobrandName;
}

- (NSURL)transactionServiceURL
{
  return self->_transactionServiceURL;
}

- (NSURL)transactionServiceRegistrationURL
{
  return self->_transactionServiceRegistrationURL;
}

- (NSString)transactionPushTopic
{
  return self->_transactionPushTopic;
}

- (NSURL)messageServiceURL
{
  return self->_messageServiceURL;
}

- (NSURL)messageServiceRegistrationURL
{
  return self->_messageServiceRegistrationURL;
}

- (NSString)messagePushTopic
{
  return self->_messagePushTopic;
}

- (NSString)appURLScheme
{
  return self->_appURLScheme;
}

- (NSDictionary)localizedSuspendedReasonsByAID
{
  return self->_localizedSuspendedReasonsByAID;
}

- (BOOL)supportsTransitOnly
{
  return self->_supportsTransitOnly;
}

- (void)setSupportsTransitOnly:(BOOL)a3
{
  self->_supportsTransitOnly = a3;
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void)setAvailableActions:(id)a3
{
}

- (NSDictionary)actionLocalizations
{
  return self->_actionLocalizations;
}

- (NSArray)actionGroups
{
  return self->_actionGroups;
}

- (void)setActionGroups:(id)a3
{
}

- (NSArray)transitCommutePlans
{
  return self->_transitCommutePlans;
}

- (unint64_t)transitCommutePlanType
{
  return self->_transitCommutePlanType;
}

- (NSArray)upgradeRequests
{
  return self->_upgradeRequests;
}

- (void)setUpgradeRequests:(id)a3
{
}

- (NSString)shippingAddressSeed
{
  return self->_shippingAddressSeed;
}

- (NSString)speakableMake
{
  return self->_speakableMake;
}

- (NSString)speakableModel
{
  return self->_speakableModel;
}

- (PKSiriIntentsConfiguration)supportedSiriIntents
{
  return self->_supportedSiriIntents;
}

- (void)setSupportedSiriIntents:(id)a3
{
}

- (PKPassAuxiliaryRegistrationRequirements)auxiliaryRegistrationRequirements
{
  return self->_auxiliaryRegistrationRequirements;
}

- (void)setAuxiliaryRegistrationRequirements:(id)a3
{
}

- (void)setDynamicLayerConfiguration:(id)a3
{
}

- (int64_t)identityType
{
  return self->_identityType;
}

- (void)setIdentityType:(int64_t)a3
{
  self->_identityType = a3;
}

- (int64_t)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(int64_t)a3
{
  self->_accessType = a3;
}

- (int64_t)paymentType
{
  return self->_paymentType;
}

- (void)setPaymentType:(int64_t)a3
{
  self->_paymentType = a3;
}

@end