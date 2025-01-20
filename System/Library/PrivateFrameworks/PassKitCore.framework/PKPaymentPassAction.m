@interface PKPaymentPassAction
+ (BOOL)supportsSecureCoding;
+ (id)effectiveActionForActions:(id)a3;
- (BOOL)featured;
- (BOOL)hasRemoteContent;
- (BOOL)isActionAvailable;
- (BOOL)remoteContentRequiresAppletData;
- (BOOL)reverseButtonTitleForLegacySuica;
- (NSArray)purchaseNewActionItems;
- (NSArray)selectedActionItems;
- (NSArray)serviceProviderAcceptedNetworks;
- (NSArray)serviceProviderSupportedNetworks;
- (NSDate)availableFrom;
- (NSDate)availableUntil;
- (NSDictionary)appletData;
- (NSDictionary)vehicleFunctionActions;
- (NSSet)serviceProviderSupportedCountries;
- (NSString)actionDescription;
- (NSString)associatedAutoTopUpIdentifier;
- (NSString)associatedEnteredValueIdentifier;
- (NSString)associatedPlanIdentifier;
- (NSString)auxiliaryPassInformationIdentifier;
- (NSString)auxiliaryPassInformationItemIdentifier;
- (NSString)confirmationTitle;
- (NSString)footerText;
- (NSString)headerText;
- (NSString)identifier;
- (NSString)relevantPropertyIdentifier;
- (NSString)serviceProviderCountryCode;
- (NSString)serviceProviderIdentifier;
- (NSString)serviceProviderLocalizedDisplayName;
- (NSString)title;
- (NSString)unavailableActionReason;
- (NSString)unavailableActionTitle;
- (NSString)unavailableActionURL;
- (NSString)unavailableAfterReason;
- (NSString)unavailableBeforeReason;
- (NSURL)externalURL;
- (PKAutoTopUpActionItem)autoTopUpItem;
- (PKEnteredValueActionItem)enteredValueItem;
- (PKImage)image;
- (PKPaymentPassAction)initWithCoder:(id)a3;
- (PKPaymentPassAction)initWithDictionary:(id)a3 bundle:(id)a4;
- (PKPaymentPassAction)initWithDictionary:(id)a3 localizations:(id)a4;
- (PKPaymentPassActionRemoteConfiguration)remoteContentConfiguration;
- (PKTransitCommutePlan)associatedPlan;
- (double)availableFromOffsetFromUTC;
- (double)availableFromRelative;
- (double)availableUntilRelative;
- (id)_initWithContext:(int64_t)a3;
- (id)_initWithExternalURL:(id)a3;
- (id)_initWithImage:(id)a3 title:(id)a4;
- (id)_localizableKeys;
- (id)actionUpdatedWithDictionary:(id)a3 localizations:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)context;
- (unint64_t)serviceProviderCapabilities;
- (unint64_t)type;
- (unint64_t)unavailableActionBehavior;
- (void)_processLocalizableStrings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionDescription:(id)a3;
- (void)setAppletData:(id)a3;
- (void)setAssociatedAutoTopUpIdentifier:(id)a3;
- (void)setAssociatedEnteredValueIdentifier:(id)a3;
- (void)setAssociatedPlan:(id)a3;
- (void)setAssociatedPlanIdentifier:(id)a3;
- (void)setAvailableFromRelative:(double)a3;
- (void)setAvailableUntilRelative:(double)a3;
- (void)setConfirmationTitle:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setReverseButtonTitleForLegacySuica:(BOOL)a3;
- (void)setServiceProviderAcceptedNetworks:(id)a3;
- (void)setServiceProviderCapabilities:(unint64_t)a3;
- (void)setServiceProviderCountryCode:(id)a3;
- (void)setServiceProviderIdentifier:(id)a3;
- (void)setServiceProviderLocalizedDisplayName:(id)a3;
- (void)setServiceProviderSupportedCountries:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentPassAction

- (PKPaymentPassAction)initWithDictionary:(id)a3 localizations:(id)a4
{
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v180.receiver = self;
  v180.super_class = (Class)PKPaymentPassAction;
  v8 = [(PKPaymentPassAction *)&v180 init];
  v9 = v8;
  v10 = &unk_191661000;
  if (!v8) {
    goto LABEL_70;
  }
  v8->_reverseButtonTitleForLegacySuica = 0;
  uint64_t v11 = [v6 copy];
  rawDictionary = v9->_rawDictionary;
  v9->_rawDictionary = (NSDictionary *)v11;

  uint64_t v13 = [v7 copy];
  localizations = v9->_localizations;
  v9->_localizations = (NSDictionary *)v13;

  v15 = [v6 PKStringForKey:@"identifier"];
  uint64_t v16 = [v15 copy];
  identifier = v9->_identifier;
  v9->_identifier = (NSString *)v16;

  v18 = [v6 PKStringForKey:@"type"];
  v9->_type = PKPaymentPassActionTypeFromString(v18);

  v19 = [PKPaymentPassActionRemoteConfiguration alloc];
  v20 = [v6 PKDictionaryForKey:@"remoteContentConfiguration"];
  uint64_t v21 = [(PKPaymentPassActionRemoteConfiguration *)v19 initWithDictionary:v20];
  remoteContentConfiguration = v9->_remoteContentConfiguration;
  v9->_remoteContentConfiguration = (PKPaymentPassActionRemoteConfiguration *)v21;

  if (!v9->_remoteContentConfiguration && [v6 PKBoolForKey:@"hasRemoteContent"])
  {
    v23 = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:]([PKPaymentPassActionRemoteConfiguration alloc], "initWithRequiresAppletData:appletDataRequiresEncryption:", [v6 PKBoolForKey:@"remoteContentRequiresAppletData"], 1);
    v24 = v9->_remoteContentConfiguration;
    v9->_remoteContentConfiguration = v23;
  }
  v25 = [v6 PKStringForKey:@"title"];
  uint64_t v26 = [v25 copy];
  title = v9->_title;
  v9->_title = (NSString *)v26;

  v28 = [v6 PKStringForKey:@"description"];
  uint64_t v29 = [v28 copy];
  actionDescription = v9->_actionDescription;
  v9->_actionDescription = (NSString *)v29;

  v31 = [v6 PKStringForKey:@"confirmationTitle"];
  uint64_t v32 = [v31 copy];
  confirmationTitle = v9->_confirmationTitle;
  v9->_confirmationTitle = (NSString *)v32;

  v9->_featured = [v6 PKBoolForKey:@"featured"];
  v34 = [v6 PKStringForKey:@"relevantPropertyIdentifier"];
  uint64_t v35 = [v34 copy];
  relevantPropertyIdentifier = v9->_relevantPropertyIdentifier;
  v9->_relevantPropertyIdentifier = (NSString *)v35;

  v37 = [v6 PKStringForKey:@"associatedPlanIdentifier"];
  uint64_t v38 = [v37 copy];
  associatedPlanIdentifier = v9->_associatedPlanIdentifier;
  v9->_associatedPlanIdentifier = (NSString *)v38;

  v40 = [v6 PKStringForKey:@"associatedEnteredValueIdentifier"];
  uint64_t v41 = [v40 copy];
  associatedEnteredValueIdentifier = v9->_associatedEnteredValueIdentifier;
  v9->_associatedEnteredValueIdentifier = (NSString *)v41;

  v43 = [v6 PKStringForKey:@"associatedAutoTopUpIdentifier"];
  uint64_t v44 = [v43 copy];
  associatedAutoTopUpIdentifier = v9->_associatedAutoTopUpIdentifier;
  v9->_associatedAutoTopUpIdentifier = (NSString *)v44;

  v46 = [v6 PKDictionaryForKey:@"appletData"];
  uint64_t v47 = [v46 copy];
  appletData = v9->_appletData;
  v9->_appletData = (NSDictionary *)v47;

  v49 = [v6 PKStringForKey:@"availableFrom"];
  double v179 = 0.0;
  uint64_t v50 = _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v49, 0, &v179);
  availableFromRaw = v9->_availableFromRaw;
  v9->_availableFromRaw = (NSDate *)v50;

  if (v9->_availableFromRaw) {
    v9->_availableFromOffsetFromUTC = v179;
  }
  v52 = [v6 PKDateForKey:@"availableUntil"];
  uint64_t v53 = [v52 copy];
  availableUntilRaw = v9->_availableUntilRaw;
  v9->_availableUntilRaw = (NSDate *)v53;

  v55 = [v6 PKStringForKey:@"unavailableBeforeReason"];
  uint64_t v56 = [v55 copy];
  unavailableBeforeReason = v9->_unavailableBeforeReason;
  v9->_unavailableBeforeReason = (NSString *)v56;

  v58 = [v6 PKStringForKey:@"unavailableAfterReason"];
  uint64_t v59 = [v58 copy];
  unavailableAfterReason = v9->_unavailableAfterReason;
  v9->_unavailableAfterReason = (NSString *)v59;

  v61 = [v6 PKStringForKey:@"unavailableActionReason"];
  uint64_t v62 = [v61 copy];
  unavailableActionReason = v9->_unavailableActionReason;
  v9->_unavailableActionReason = (NSString *)v62;

  v64 = [v6 PKStringForKey:@"unavailableActionTitle"];
  uint64_t v65 = [v64 copy];
  unavailableActionTitle = v9->_unavailableActionTitle;
  v9->_unavailableActionTitle = (NSString *)v65;

  v67 = [v6 PKStringForKey:@"unavailableActionURL"];
  uint64_t v68 = [v67 copy];
  unavailableActionURL = v9->_unavailableActionURL;
  v9->_unavailableActionURL = (NSString *)v68;

  v9->_unavailableActionBehavior = [v6 PKIntegerForKey:@"unavailableActionBehavior"];
  v70 = [v6 PKStringForKey:@"serviceProviderIdentifier"];
  uint64_t v71 = [v70 copy];
  serviceProviderIdentifier = v9->_serviceProviderIdentifier;
  v9->_serviceProviderIdentifier = (NSString *)v71;

  v73 = [v6 PKStringForKey:@"serviceProviderLocalizedDisplayName"];
  uint64_t v74 = [v73 copy];
  serviceProviderLocalizedDisplayName = v9->_serviceProviderLocalizedDisplayName;
  v9->_serviceProviderLocalizedDisplayName = (NSString *)v74;

  v76 = [v6 PKStringForKey:@"serviceProviderCountryCode"];
  uint64_t v77 = [v76 copy];
  serviceProviderCountryCode = v9->_serviceProviderCountryCode;
  v9->_serviceProviderCountryCode = (NSString *)v77;

  v79 = [v6 PKArrayContaining:objc_opt_class() forKey:@"serviceProviderAcceptedNetworks"];
  if (!v79)
  {
    v79 = [v6 PKArrayContaining:objc_opt_class() forKey:@"serviceProviderSupportedNetworks"];
  }
  v80 = +[PKServiceProviderPaymentRequest availableNetworks];
  uint64_t v81 = objc_msgSend(v79, "pk_intersectArray:", v80);
  serviceProviderAcceptedNetworks = v9->_serviceProviderAcceptedNetworks;
  v9->_serviceProviderAcceptedNetworks = (NSArray *)v81;

  v83 = [v6 PKArrayContaining:objc_opt_class() forKey:@"serviceProviderCapabilities"];
  v9->_serviceProviderCapabilities = PKMerchantCapabilityFromStrings(v83);

  v84 = [v6 PKSetForKey:@"serviceProviderSupportedCountries"];
  if ([v84 count]) {
    v85 = v84;
  }
  else {
    v85 = 0;
  }
  objc_storeStrong((id *)&v9->_serviceProviderSupportedCountries, v85);
  switch(v9->_type)
  {
    case 1uLL:
      id auxiliaryPassInformationItemIdentifier = [v6 PKDictionaryForKey:@"item"];
      if (!auxiliaryPassInformationItemIdentifier) {
        goto LABEL_68;
      }
      v87 = [[PKEnteredValueActionItem alloc] initWithDictionary:auxiliaryPassInformationItemIdentifier];
      enteredValueItem = v9->_enteredValueItem;
      v9->_enteredValueItem = v87;
      goto LABEL_56;
    case 2uLL:
      id v163 = v7;
      v164 = v84;
      v161 = v79;
      v162 = v49;
      v89 = [v6 PKStringForKey:@"headerText"];
      uint64_t v90 = [v89 copy];
      headerText = v9->_headerText;
      v9->_headerText = (NSString *)v90;

      v92 = [v6 PKStringForKey:@"footerText"];
      uint64_t v93 = [v92 copy];
      footerText = v9->_footerText;
      v9->_footerText = (NSString *)v93;

      [v6 PKDoubleForKey:@"availableFromRelative"];
      v9->_availableFromRelative = v95;
      [v6 PKDoubleForKey:@"availableUntilRelative"];
      v9->_availableUntilRelative = v96;
      id auxiliaryPassInformationItemIdentifier = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      v97 = [v6 PKArrayForKey:@"items"];
      uint64_t v98 = [v97 countByEnumeratingWithState:&v175 objects:v182 count:16];
      if (v98)
      {
        uint64_t v99 = v98;
        uint64_t v100 = *(void *)v176;
        do
        {
          for (uint64_t i = 0; i != v99; ++i)
          {
            if (*(void *)v176 != v100) {
              objc_enumerationMutation(v97);
            }
            uint64_t v102 = *(void *)(*((void *)&v175 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v103 = [[PKSelectedItemActionItem alloc] initWithDictionary:v102];
              if (v103) {
                [auxiliaryPassInformationItemIdentifier addObject:v103];
              }
            }
          }
          uint64_t v99 = [v97 countByEnumeratingWithState:&v175 objects:v182 count:16];
        }
        while (v99);
      }

      uint64_t v104 = [auxiliaryPassInformationItemIdentifier copy];
      selectedActionItems = v9->_selectedActionItems;
      v9->_selectedActionItems = (NSArray *)v104;

      if ([(NSArray *)v9->_selectedActionItems count] != 1) {
        goto LABEL_59;
      }
      v106 = [(NSArray *)v9->_selectedActionItems firstObject];
      v107 = [v106 amount];
      v108 = [v106 currency];
      uint64_t v160 = PKFormattedCurrencyStringFromNumber(v107, v108);

      v109 = v9->_actionDescription;
      v110 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      id v111 = [(NSString *)v109 stringByTrimmingCharactersInSet:v110];
      if (!v111)
      {

        goto LABEL_62;
      }
      v112 = v111;
      uint64_t v113 = [v111 length];

      if (!v113)
      {
LABEL_62:
        v114 = (void *)v160;
        goto LABEL_65;
      }
      id v7 = v163;
      v10 = (void *)&unk_191661000;
      v114 = (void *)v160;
      v79 = v161;
      v84 = v164;
      if (v160 && ![(NSString *)v9->_actionDescription containsString:v160]) {
        goto LABEL_53;
      }
LABEL_67:

LABEL_68:
LABEL_69:

LABEL_70:
      v165[0] = MEMORY[0x1E4F143A8];
      v165[1] = v10[259];
      v165[2] = __56__PKPaymentPassAction_initWithDictionary_localizations___block_invoke_2;
      v165[3] = &unk_1E56E3538;
      v158 = v9;
      v166 = v158;
      [(PKPaymentPassAction *)v158 _processLocalizableStrings:v165];

      return v158;
    case 3uLL:
      id auxiliaryPassInformationItemIdentifier = [v6 PKStringForKey:@"url"];
      if (!auxiliaryPassInformationItemIdentifier) {
        goto LABEL_68;
      }
      uint64_t v115 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:auxiliaryPassInformationItemIdentifier];
      enteredValueItem = v9->_externalURL;
      v9->_externalURL = (NSURL *)v115;
      goto LABEL_56;
    case 4uLL:
      id auxiliaryPassInformationItemIdentifier = [v6 PKDictionaryForKey:@"vehicleFunctionActions"];
      if (!auxiliaryPassInformationItemIdentifier) {
        goto LABEL_68;
      }
      v164 = v84;
      id v116 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v117 = objc_opt_class();
      uint64_t v118 = objc_opt_class();
      v167[0] = MEMORY[0x1E4F143A8];
      v167[1] = 3221225472;
      v167[2] = __56__PKPaymentPassAction_initWithDictionary_localizations___block_invoke;
      v167[3] = &unk_1E56E3510;
      uint64_t v169 = v117;
      uint64_t v170 = v118;
      id v119 = v116;
      id v168 = v119;
      [auxiliaryPassInformationItemIdentifier enumerateKeysAndObjectsUsingBlock:v167];
      if ([v119 count])
      {
        uint64_t v120 = [v119 copy];
        vehicleFunctionActions = v9->_vehicleFunctionActions;
        v9->_vehicleFunctionActions = (NSDictionary *)v120;
      }
      v10 = &unk_191661000;
      goto LABEL_60;
    case 5uLL:
      id v163 = v7;
      v164 = v84;
      v161 = v79;
      v162 = v49;
      v122 = [v6 PKStringForKey:@"headerText"];
      uint64_t v123 = [v122 copy];
      v124 = v9->_headerText;
      v9->_headerText = (NSString *)v123;

      v125 = [v6 PKStringForKey:@"footerText"];
      uint64_t v126 = [v125 copy];
      v127 = v9->_footerText;
      v9->_footerText = (NSString *)v126;

      id auxiliaryPassInformationItemIdentifier = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v171 = 0u;
      long long v172 = 0u;
      long long v173 = 0u;
      long long v174 = 0u;
      v128 = [v6 PKArrayForKey:@"items"];
      uint64_t v129 = [v128 countByEnumeratingWithState:&v171 objects:v181 count:16];
      if (v129)
      {
        uint64_t v130 = v129;
        uint64_t v131 = *(void *)v172;
        do
        {
          for (uint64_t j = 0; j != v130; ++j)
          {
            if (*(void *)v172 != v131) {
              objc_enumerationMutation(v128);
            }
            uint64_t v133 = *(void *)(*((void *)&v171 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v134 = [[PKPurchaseNewActionItem alloc] initWithDictionary:v133];
              if (v134) {
                [auxiliaryPassInformationItemIdentifier addObject:v134];
              }
            }
          }
          uint64_t v130 = [v128 countByEnumeratingWithState:&v171 objects:v181 count:16];
        }
        while (v130);
      }

      uint64_t v135 = [auxiliaryPassInformationItemIdentifier copy];
      purchaseNewActionItems = v9->_purchaseNewActionItems;
      v9->_purchaseNewActionItems = (NSArray *)v135;

      if ([(NSArray *)v9->_purchaseNewActionItems count] != 1)
      {
LABEL_59:
        v49 = v162;
        id v7 = v163;
        v10 = (void *)&unk_191661000;
        v79 = v161;
LABEL_60:
        v84 = v164;
        goto LABEL_68;
      }
      v106 = [(NSArray *)v9->_purchaseNewActionItems firstObject];
      v137 = [v106 amount];
      v138 = [v106 currency];
      uint64_t v139 = PKFormattedCurrencyStringFromNumber(v137, v138);

      v140 = v9->_actionDescription;
      v141 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      id v142 = [(NSString *)v140 stringByTrimmingCharactersInSet:v141];
      if (v142)
      {
        v143 = v142;
        uint64_t v144 = [v142 length];

        if (v144)
        {
          v114 = (void *)v139;
          BOOL v145 = [(NSString *)v9->_actionDescription containsString:v139];
          v49 = v162;
          id v7 = v163;
          v10 = (void *)&unk_191661000;
          v79 = v161;
          v84 = v164;
          if (v145) {
            goto LABEL_67;
          }
LABEL_53:
          v146 = [NSString stringWithFormat:@"%@ - %@", v114, v9->_actionDescription];
LABEL_66:
          v157 = v9->_actionDescription;
          v9->_actionDescription = v146;

          goto LABEL_67;
        }
      }
      else
      {
      }
      v114 = (void *)v139;
LABEL_65:
      v146 = v114;
      v49 = v162;
      id v7 = v163;
      v10 = &unk_191661000;
      v79 = v161;
      v84 = v164;
      goto LABEL_66;
    case 6uLL:
      v147 = [v6 PKStringForKey:@"headerText"];
      uint64_t v148 = [v147 copy];
      v149 = v9->_headerText;
      v9->_headerText = (NSString *)v148;

      v150 = [v6 PKStringForKey:@"footerText"];
      uint64_t v151 = [v150 copy];
      v152 = v9->_footerText;
      v9->_footerText = (NSString *)v151;

      id auxiliaryPassInformationItemIdentifier = [v6 PKDictionaryForKey:@"item"];
      if (!auxiliaryPassInformationItemIdentifier) {
        goto LABEL_68;
      }
      v153 = [[PKAutoTopUpActionItem alloc] initWithDictionary:auxiliaryPassInformationItemIdentifier];
      enteredValueItem = v9->_autoTopUpItem;
      v9->_autoTopUpItem = v153;
LABEL_56:

      goto LABEL_68;
    case 7uLL:
      uint64_t v154 = [v6 PKStringForKey:@"auxiliaryPassInformationIdentifier"];
      auxiliaryPassInformationIdentifier = v9->_auxiliaryPassInformationIdentifier;
      v9->_auxiliaryPassInformationIdentifier = (NSString *)v154;

      uint64_t v156 = [v6 PKStringForKey:@"auxiliaryPassInformationItemIdentifier"];
      id auxiliaryPassInformationItemIdentifier = v9->_auxiliaryPassInformationItemIdentifier;
      v9->_id auxiliaryPassInformationItemIdentifier = (NSString *)v156;
      goto LABEL_68;
    case 8uLL:
      id auxiliaryPassInformationItemIdentifier = [v6 PKStringForKey:@"context"];
      v9->_context = PKPassTileContextFromString(auxiliaryPassInformationItemIdentifier);
      goto LABEL_68;
    default:
      goto LABEL_69;
  }
}

void __56__PKPaymentPassAction_initWithDictionary_localizations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
  {
    unsigned int v10 = 0;
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v5];
    if ([v7 scanHexInt:&v10] && objc_msgSend(v7, "isAtEnd"))
    {
      v8 = *(void **)(a1 + 32);
      v9 = [NSNumber numberWithUnsignedInt:v10];
      [v8 setObject:v6 forKeyedSubscript:v9];
    }
  }
}

id __56__PKPaymentPassAction_initWithDictionary_localizations___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 16);
    id v3 = a2;
    uint64_t v4 = [v2 objectForKeyedSubscript:v3];
    id v5 = (void *)v4;
    if (v4) {
      id v6 = (void *)v4;
    }
    else {
      id v6 = v3;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (PKPaymentPassAction)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = [a4 pathForResource:@"actions" ofType:@"strings"];
    a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v7];
    self = [(PKPaymentPassAction *)self initWithDictionary:v6 localizations:a4];
  }
  v8 = [(PKPaymentPassAction *)self initWithDictionary:v6 localizations:a4];

  return v8;
}

- (id)_initWithExternalURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPassAction;
  id v6 = [(PKPaymentPassAction *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_externalURL, a3);
  }

  return v7;
}

- (id)_initWithContext:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPassAction;
  id result = [(PKPaymentPassAction *)&v5 init];
  if (result)
  {
    *((void *)result + 8) = 8;
    *((void *)result + 32) = a3;
  }
  return result;
}

- (id)_initWithImage:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassAction;
  objc_super v9 = [(PKPaymentPassAction *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_type = 9;
    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (id)_localizableKeys
{
  return &unk_1EE22AE20;
}

- (NSString)title
{
  uint64_t v2 = 96;
  if (!self->_reverseButtonTitleForLegacySuica) {
    uint64_t v2 = 24;
  }
  return (NSString *)*(id *)((char *)&self->super.isa + v2);
}

- (void)_processLocalizableStrings:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v5 = [(PKPaymentPassAction *)self _localizableKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v11 = [(PKPaymentPassAction *)self valueForKey:v10];
          if (v11)
          {
            objc_super v12 = v4[2](v4, v11);
            if (v12) {
              [(PKPaymentPassAction *)self setValue:v12 forKey:v10];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    [(PKEnteredValueActionItem *)self->_enteredValueItem _processLocalizableStrings:v4];
    [(PKAutoTopUpActionItem *)self->_autoTopUpItem _processLocalizableStrings:v4];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v13 = self->_selectedActionItems;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "_processLocalizableStrings:", v4, (void)v18);
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
}

- (id)actionUpdatedWithDictionary:(id)a3 localizations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKPaymentPassAction *)self identifier];
  objc_super v9 = [v6 PKStringForKey:@"identifier"];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = (void *)[(NSDictionary *)self->_rawDictionary mutableCopy];
    [v11 addEntriesFromDictionary:v6];
    objc_super v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDictionary:v11 localizations:v7];
    uint64_t v13 = v12;
    if (v12)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __65__PKPaymentPassAction_actionUpdatedWithDictionary_localizations___block_invoke;
      v15[3] = &unk_1E56E3538;
      v15[4] = self;
      [v12 _processLocalizableStrings:v15];
      [v13 setAssociatedPlan:self->_associatedPlan];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

id __65__PKPaymentPassAction_actionUpdatedWithDictionary_localizations___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
    id v3 = a2;
    uint64_t v4 = [v2 objectForKeyedSubscript:v3];
    objc_super v5 = (void *)v4;
    if (v4) {
      id v6 = (void *)v4;
    }
    else {
      id v6 = v3;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

+ (id)effectiveActionForActions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    objc_super v5 = objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_69);
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

uint64_t __49__PKPaymentPassAction_effectiveActionForActions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActionAvailable];
}

- (NSDate)availableFrom
{
  if (self->_type == 2
    && (associatedPlan = self->_associatedPlan) != 0
    && !self->_availableFromRaw
    && self->_availableFromRelative != 0.0
    && ([(PKTransitCommutePlan *)associatedPlan startDate],
        (objc_super v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (int v10 = v9,
        [v9 dateByAddingTimeInterval:self->_availableFromRelative],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    uint64_t v4 = v11;
    objc_super v5 = v4;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    objc_super v5 = 0;
  }
  if (self->_availableFromRaw) {
    availableFromRaw = self->_availableFromRaw;
  }
  else {
    availableFromRaw = v4;
  }
  id v7 = availableFromRaw;

  return v7;
}

- (NSDate)availableUntil
{
  if (self->_type == 2
    && (associatedPlan = self->_associatedPlan) != 0
    && !self->_availableUntilRaw
    && self->_availableUntilRelative != 0.0
    && ([(PKTransitCommutePlan *)associatedPlan expiryDate],
        (objc_super v9 = objc_claimAutoreleasedReturnValue()) != 0)
    && (int v10 = v9,
        [v9 dateByAddingTimeInterval:self->_availableUntilRelative],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    uint64_t v4 = v11;
    objc_super v5 = v4;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
    objc_super v5 = 0;
  }
  if (self->_availableUntilRaw) {
    availableUntilRaw = self->_availableUntilRaw;
  }
  else {
    availableUntilRaw = v4;
  }
  id v7 = availableUntilRaw;

  return v7;
}

- (BOOL)isActionAvailable
{
  id v3 = [(PKPaymentPassAction *)self availableFrom];
  uint64_t v4 = [(PKPaymentPassAction *)self availableUntil];
  objc_super v5 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v6 = [v5 compare:v3] == 1 && objc_msgSend(v5, "compare:", v4) == -1;

  return v6;
}

- (BOOL)hasRemoteContent
{
  return self->_remoteContentConfiguration != 0;
}

- (BOOL)remoteContentRequiresAppletData
{
  remoteContentConfiguration = self->_remoteContentConfiguration;
  if (remoteContentConfiguration) {
    LOBYTE(remoteContentConfiguration) = [(PKPaymentPassActionRemoteConfiguration *)remoteContentConfiguration requiresAppletData];
  }
  return (char)remoteContentConfiguration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentPassAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v135.receiver = self;
  v135.super_class = (Class)PKPaymentPassAction;
  objc_super v5 = [(PKPaymentPassAction *)&v135 init];
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v134 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v11 = objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    uint64_t v12 = [v11 copy];
    rawDictionary = v5->_rawDictionary;
    v5->_rawDictionary = (NSDictionary *)v12;

    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v133 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    long long v20 = objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    uint64_t v21 = [v20 copy];
    localizations = v5->_localizations;
    v5->_localizations = (NSDictionary *)v21;

    long long v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v24 = [v23 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = PKPaymentPassActionTypeFromString(v26);

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteContentConfiguration"];
    remoteContentConfiguration = v5->_remoteContentConfiguration;
    v5->_remoteContentConfiguration = (PKPaymentPassActionRemoteConfiguration *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v30 = [v29 copy];
    title = v5->_title;
    v5->_title = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionDescription"];
    uint64_t v33 = [v32 copy];
    actionDescription = v5->_actionDescription;
    v5->_actionDescription = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmationTitle"];
    uint64_t v36 = [v35 copy];
    confirmationTitle = v5->_confirmationTitle;
    v5->_confirmationTitle = (NSString *)v36;

    v5->_featured = [v4 decodeBoolForKey:@"featured"];
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletData"];
    appletData = v5->_appletData;
    v5->_appletData = (NSDictionary *)v38;

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relevantPropertyIdentifier"];
    uint64_t v41 = [v40 copy];
    relevantPropertyIdentifier = v5->_relevantPropertyIdentifier;
    v5->_relevantPropertyIdentifier = (NSString *)v41;

    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPlanIdentifier"];
    uint64_t v44 = [v43 copy];
    associatedPlanIdentifier = v5->_associatedPlanIdentifier;
    v5->_associatedPlanIdentifier = (NSString *)v44;

    v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedEnteredValueIdentifier"];
    uint64_t v47 = [v46 copy];
    associatedEnteredValueIdentifier = v5->_associatedEnteredValueIdentifier;
    v5->_associatedEnteredValueIdentifier = (NSString *)v47;

    v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedAutoTopUpIdentifier"];
    uint64_t v50 = [v49 copy];
    associatedAutoTopUpIdentifier = v5->_associatedAutoTopUpIdentifier;
    v5->_associatedAutoTopUpIdentifier = (NSString *)v50;

    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPlan"];
    uint64_t v53 = [v52 copy];
    associatedPlan = v5->_associatedPlan;
    v5->_associatedPlan = (PKTransitCommutePlan *)v53;

    v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableFrom"];
    uint64_t v56 = [v55 copy];
    availableFromRaw = v5->_availableFromRaw;
    v5->_availableFromRaw = (NSDate *)v56;

    [v4 decodeDoubleForKey:@"availableFromOffsetFromUTC"];
    v5->_availableFromOffsetFromUTC = v58;
    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableUntil"];
    uint64_t v60 = [v59 copy];
    availableUntilRaw = v5->_availableUntilRaw;
    v5->_availableUntilRaw = (NSDate *)v60;

    [v4 decodeDoubleForKey:@"availableFromRelative"];
    v5->_availableFromRelative = v62;
    [v4 decodeDoubleForKey:@"availableUntilRelative"];
    v5->_availableUntilRelative = v63;
    v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unavailableBeforeReason"];
    uint64_t v65 = [v64 copy];
    unavailableBeforeReason = v5->_unavailableBeforeReason;
    v5->_unavailableBeforeReason = (NSString *)v65;

    v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unavailableAfterReason"];
    uint64_t v68 = [v67 copy];
    unavailableAfterReason = v5->_unavailableAfterReason;
    v5->_unavailableAfterReason = (NSString *)v68;

    v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unavailableActionReason"];
    uint64_t v71 = [v70 copy];
    unavailableActionReason = v5->_unavailableActionReason;
    v5->_unavailableActionReason = (NSString *)v71;

    v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unavailableActionTitle"];
    uint64_t v74 = [v73 copy];
    unavailableActionTitle = v5->_unavailableActionTitle;
    v5->_unavailableActionTitle = (NSString *)v74;

    v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unavailableActionURL"];
    uint64_t v77 = [v76 copy];
    unavailableActionURL = v5->_unavailableActionURL;
    v5->_unavailableActionURL = (NSString *)v77;

    v5->_unavailableActionBehavior = [v4 decodeIntegerForKey:@"unavailableActionBehavior"];
    v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderIdentifier"];
    uint64_t v80 = [v79 copy];
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v80;

    v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderLocalizedDisplayName"];
    uint64_t v83 = [v82 copy];
    serviceProviderLocalizedDisplayName = v5->_serviceProviderLocalizedDisplayName;
    v5->_serviceProviderLocalizedDisplayName = (NSString *)v83;

    v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderCountryCode"];
    uint64_t v86 = [v85 copy];
    serviceProviderCountryCode = v5->_serviceProviderCountryCode;
    v5->_serviceProviderCountryCode = (NSString *)v86;

    v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderCapabilities"];
    v5->_serviceProviderCapabilities = [v88 unsignedIntegerValue];

    v89 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v90 = objc_opt_class();
    v91 = objc_msgSend(v89, "setWithObjects:", v90, objc_opt_class(), 0);
    v92 = [v4 decodeObjectOfClasses:v91 forKey:@"serviceProviderAcceptedNetworks"];
    uint64_t v93 = [v92 copy];
    serviceProviderAcceptedNetworks = v5->_serviceProviderAcceptedNetworks;
    v5->_serviceProviderAcceptedNetworks = (NSArray *)v93;

    double v95 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v96 = objc_opt_class();
    v97 = objc_msgSend(v95, "setWithObjects:", v96, objc_opt_class(), 0);
    uint64_t v98 = [v4 decodeObjectOfClasses:v97 forKey:@"serviceProviderSupportedCountries"];
    serviceProviderSupportedCountries = v5->_serviceProviderSupportedCountries;
    v5->_serviceProviderSupportedCountries = (NSSet *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enteredValueItem"];
    enteredValueItem = v5->_enteredValueItem;
    v5->_enteredValueItem = (PKEnteredValueActionItem *)v100;

    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoTopUpItem"];
    autoTopUpItem = v5->_autoTopUpItem;
    v5->_autoTopUpItem = (PKAutoTopUpActionItem *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"headerText"];
    uint64_t v105 = [v104 copy];
    headerText = v5->_headerText;
    v5->_headerText = (NSString *)v105;

    v107 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footerText"];
    uint64_t v108 = [v107 copy];
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v108;

    v110 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v111 = objc_opt_class();
    v112 = objc_msgSend(v110, "setWithObjects:", v111, objc_opt_class(), 0);
    uint64_t v113 = [v4 decodeObjectOfClasses:v112 forKey:@"selectedActionItems"];
    uint64_t v114 = [v113 copy];
    selectedActionItems = v5->_selectedActionItems;
    v5->_selectedActionItems = (NSArray *)v114;

    uint64_t v116 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalURL"];
    externalURL = v5->_externalURL;
    v5->_externalURL = (NSURL *)v116;

    id v118 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v119 = objc_opt_class();
    uint64_t v120 = objc_msgSend(v118, "initWithObjects:", v119, objc_opt_class(), 0);
    uint64_t v121 = [v4 decodeObjectOfClasses:v120 forKey:@"vehicleFunctionActions"];
    vehicleFunctionActions = v5->_vehicleFunctionActions;
    v5->_vehicleFunctionActions = (NSDictionary *)v121;

    uint64_t v123 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auxiliaryPassInformationIdentifier"];
    auxiliaryPassInformationIdentifier = v5->_auxiliaryPassInformationIdentifier;
    v5->_auxiliaryPassInformationIdentifier = (NSString *)v123;

    uint64_t v125 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auxiliaryPassInformationItemIdentifier"];
    id auxiliaryPassInformationItemIdentifier = v5->_auxiliaryPassInformationItemIdentifier;
    v5->_id auxiliaryPassInformationItemIdentifier = (NSString *)v125;

    v127 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    v5->_context = PKPassTileContextFromString(v127);

    uint64_t v128 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (PKImage *)v128;

    if (!v5->_remoteContentConfiguration
      && [v4 decodeBoolForKey:@"hasRemoteContent"])
    {
      uint64_t v130 = -[PKPaymentPassActionRemoteConfiguration initWithRequiresAppletData:appletDataRequiresEncryption:]([PKPaymentPassActionRemoteConfiguration alloc], "initWithRequiresAppletData:appletDataRequiresEncryption:", [v4 decodeBoolForKey:@"remoteContentRequiresAppletData"], 1);
      uint64_t v131 = v5->_remoteContentConfiguration;
      v5->_remoteContentConfiguration = v130;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_rawDictionary forKey:@"rawDictionary"];
  [v8 encodeObject:self->_localizations forKey:@"localizations"];
  [v8 encodeObject:self->_identifier forKey:@"identifier"];
  [v8 encodeObject:self->_remoteContentConfiguration forKey:@"remoteContentConfiguration"];
  unint64_t v4 = self->_type - 1;
  if (v4 > 8) {
    objc_super v5 = @"unknown";
  }
  else {
    objc_super v5 = off_1E56E3578[v4];
  }
  [v8 encodeObject:v5 forKey:@"type"];
  [v8 encodeObject:self->_appletData forKey:@"appletData"];
  [v8 encodeObject:self->_title forKey:@"title"];
  [v8 encodeObject:self->_actionDescription forKey:@"actionDescription"];
  [v8 encodeObject:self->_confirmationTitle forKey:@"confirmationTitle"];
  [v8 encodeBool:self->_featured forKey:@"featured"];
  [v8 encodeObject:self->_relevantPropertyIdentifier forKey:@"relevantPropertyIdentifier"];
  [v8 encodeObject:self->_associatedPlanIdentifier forKey:@"associatedPlanIdentifier"];
  [v8 encodeObject:self->_associatedEnteredValueIdentifier forKey:@"associatedEnteredValueIdentifier"];
  [v8 encodeObject:self->_associatedAutoTopUpIdentifier forKey:@"associatedAutoTopUpIdentifier"];
  [v8 encodeObject:self->_associatedPlan forKey:@"associatedPlan"];
  [v8 encodeObject:self->_availableFromRaw forKey:@"availableFrom"];
  [v8 encodeDouble:@"availableFromOffsetFromUTC" forKey:self->_availableFromOffsetFromUTC];
  [v8 encodeObject:self->_availableUntilRaw forKey:@"availableUntil"];
  [v8 encodeDouble:@"availableFromRelative" forKey:self->_availableFromRelative];
  [v8 encodeDouble:@"availableUntilRelative" forKey:self->_availableUntilRelative];
  [v8 encodeObject:self->_unavailableBeforeReason forKey:@"unavailableBeforeReason"];
  [v8 encodeObject:self->_unavailableAfterReason forKey:@"unavailableAfterReason"];
  [v8 encodeObject:self->_unavailableActionReason forKey:@"unavailableActionReason"];
  [v8 encodeObject:self->_unavailableActionTitle forKey:@"unavailableActionTitle"];
  [v8 encodeObject:self->_unavailableActionURL forKey:@"unavailableActionURL"];
  [v8 encodeInteger:self->_unavailableActionBehavior forKey:@"unavailableActionBehavior"];
  [v8 encodeObject:self->_serviceProviderIdentifier forKey:@"serviceProviderIdentifier"];
  [v8 encodeObject:self->_serviceProviderLocalizedDisplayName forKey:@"serviceProviderLocalizedDisplayName"];
  [v8 encodeObject:self->_serviceProviderCountryCode forKey:@"serviceProviderCountryCode"];
  [v8 encodeObject:self->_serviceProviderAcceptedNetworks forKey:@"serviceProviderAcceptedNetworks"];
  BOOL v6 = [NSNumber numberWithUnsignedInteger:self->_serviceProviderCapabilities];
  [v8 encodeObject:v6 forKey:@"serviceProviderCapabilities"];

  [v8 encodeObject:self->_serviceProviderSupportedCountries forKey:@"serviceProviderSupportedCountries"];
  [v8 encodeObject:self->_enteredValueItem forKey:@"enteredValueItem"];
  [v8 encodeObject:self->_autoTopUpItem forKey:@"autoTopUpItem"];
  [v8 encodeObject:self->_headerText forKey:@"headerText"];
  [v8 encodeObject:self->_footerText forKey:@"footerText"];
  [v8 encodeObject:self->_selectedActionItems forKey:@"selectedActionItems"];
  [v8 encodeObject:self->_externalURL forKey:@"externalURL"];
  [v8 encodeObject:self->_vehicleFunctionActions forKey:@"vehicleFunctionActions"];
  [v8 encodeObject:self->_auxiliaryPassInformationIdentifier forKey:@"auxiliaryPassInformationIdentifier"];
  [v8 encodeObject:self->_auxiliaryPassInformationItemIdentifier forKey:@"auxiliaryPassInformationItemIdentifier"];
  uint64_t v7 = PKPassTileContextToString(self->_context);
  [v8 encodeObject:v7 forKey:@"context"];

  [v8 encodeObject:self->_image forKey:@"image"];
  objc_msgSend(v8, "encodeBool:forKey:", -[PKPaymentPassAction hasRemoteContent](self, "hasRemoteContent"), @"hasRemoteContent");
  objc_msgSend(v8, "encodeBool:forKey:", -[PKPaymentPassAction remoteContentRequiresAppletData](self, "remoteContentRequiresAppletData"), @"remoteContentRequiresAppletData");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSDictionary *)self->_rawDictionary copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSDictionary *)self->_localizations copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  *(void *)(v5 + 64) = self->_type;
  id v12 = [(PKPaymentPassActionRemoteConfiguration *)self->_remoteContentConfiguration copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  uint64_t v14 = [(NSDictionary *)self->_appletData copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  uint64_t v16 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  uint64_t v18 = [(NSString *)self->_actionDescription copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  uint64_t v20 = [(NSString *)self->_confirmationTitle copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v20;

  *(unsigned char *)(v5 + 49) = self->_featured;
  uint64_t v22 = [(NSString *)self->_relevantPropertyIdentifier copyWithZone:a3];
  long long v23 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v22;

  uint64_t v24 = [(NSString *)self->_associatedPlanIdentifier copyWithZone:a3];
  long long v25 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v24;

  uint64_t v26 = [(NSString *)self->_associatedEnteredValueIdentifier copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v26;

  uint64_t v28 = [(NSString *)self->_associatedAutoTopUpIdentifier copyWithZone:a3];
  uint64_t v29 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v28;

  id v30 = [(PKTransitCommutePlan *)self->_associatedPlan copyWithZone:a3];
  v31 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v30;

  uint64_t v32 = [(NSDate *)self->_availableFromRaw copyWithZone:a3];
  uint64_t v33 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v32;

  *(double *)(v5 + 144) = self->_availableFromOffsetFromUTC;
  *(double *)(v5 + 304) = self->_availableFromRelative;
  *(double *)(v5 + 312) = self->_availableUntilRelative;
  uint64_t v34 = [(NSDate *)self->_availableUntilRaw copyWithZone:a3];
  uint64_t v35 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v34;

  uint64_t v36 = [(NSString *)self->_unavailableBeforeReason copyWithZone:a3];
  v37 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v36;

  uint64_t v38 = [(NSString *)self->_unavailableAfterReason copyWithZone:a3];
  v39 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v38;

  uint64_t v40 = [(NSString *)self->_unavailableActionReason copyWithZone:a3];
  uint64_t v41 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v40;

  uint64_t v42 = [(NSString *)self->_unavailableActionTitle copyWithZone:a3];
  v43 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v42;

  uint64_t v44 = [(NSString *)self->_unavailableActionURL copyWithZone:a3];
  v45 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v44;

  *(void *)(v5 + 192) = self->_unavailableActionBehavior;
  uint64_t v46 = [(NSString *)self->_serviceProviderIdentifier copyWithZone:a3];
  uint64_t v47 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v46;

  uint64_t v48 = [(NSString *)self->_serviceProviderLocalizedDisplayName copyWithZone:a3];
  v49 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v48;

  uint64_t v50 = [(NSString *)self->_serviceProviderCountryCode copyWithZone:a3];
  v51 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v50;

  uint64_t v52 = [(NSArray *)self->_serviceProviderAcceptedNetworks copyWithZone:a3];
  uint64_t v53 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v52;

  *(void *)(v5 + 240) = self->_serviceProviderCapabilities;
  uint64_t v54 = [(NSSet *)self->_serviceProviderSupportedCountries copyWithZone:a3];
  v55 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v54;

  id v56 = [(PKEnteredValueActionItem *)self->_enteredValueItem copyWithZone:a3];
  v57 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v56;

  id v58 = [(PKAutoTopUpActionItem *)self->_autoTopUpItem copyWithZone:a3];
  uint64_t v59 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v58;

  uint64_t v60 = [(NSString *)self->_headerText copyWithZone:a3];
  v61 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v60;

  uint64_t v62 = [(NSString *)self->_footerText copyWithZone:a3];
  double v63 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v62;

  uint64_t v64 = [(NSArray *)self->_selectedActionItems copyWithZone:a3];
  uint64_t v65 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v64;

  uint64_t v66 = [(NSArray *)self->_purchaseNewActionItems copyWithZone:a3];
  v67 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v66;

  uint64_t v68 = [(NSURL *)self->_externalURL copyWithZone:a3];
  v69 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v68;

  uint64_t v70 = [(NSDictionary *)self->_vehicleFunctionActions copyWithZone:a3];
  uint64_t v71 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v70;

  uint64_t v72 = [(NSString *)self->_auxiliaryPassInformationIdentifier copyWithZone:a3];
  v73 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v72;

  uint64_t v74 = [(NSString *)self->_auxiliaryPassInformationItemIdentifier copyWithZone:a3];
  v75 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v74;

  *(void *)(v5 + 256) = self->_context;
  uint64_t v76 = [(PKImage *)self->_image copy];
  uint64_t v77 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v76;

  return (id)v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t v4 = self->_type - 1;
  if (v4 > 8) {
    uint64_t v5 = @"unknown";
  }
  else {
    uint64_t v5 = off_1E56E3578[v4];
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  if (self->_remoteContentConfiguration) {
    [v3 appendFormat:@"remoteContent: '%@'; ", self->_remoteContentConfiguration];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)serviceProviderSupportedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKPaymentPassActionRemoteConfiguration)remoteContentConfiguration
{
  return self->_remoteContentConfiguration;
}

- (NSDictionary)appletData
{
  return self->_appletData;
}

- (void)setAppletData:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void)setActionDescription:(id)a3
{
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void)setConfirmationTitle:(id)a3
{
}

- (BOOL)reverseButtonTitleForLegacySuica
{
  return self->_reverseButtonTitleForLegacySuica;
}

- (void)setReverseButtonTitleForLegacySuica:(BOOL)a3
{
  self->_reverseButtonTitleForLegacySuica = a3;
}

- (BOOL)featured
{
  return self->_featured;
}

- (NSString)relevantPropertyIdentifier
{
  return self->_relevantPropertyIdentifier;
}

- (NSString)associatedEnteredValueIdentifier
{
  return self->_associatedEnteredValueIdentifier;
}

- (void)setAssociatedEnteredValueIdentifier:(id)a3
{
}

- (NSString)associatedPlanIdentifier
{
  return self->_associatedPlanIdentifier;
}

- (void)setAssociatedPlanIdentifier:(id)a3
{
}

- (NSString)associatedAutoTopUpIdentifier
{
  return self->_associatedAutoTopUpIdentifier;
}

- (void)setAssociatedAutoTopUpIdentifier:(id)a3
{
}

- (PKTransitCommutePlan)associatedPlan
{
  return self->_associatedPlan;
}

- (void)setAssociatedPlan:(id)a3
{
}

- (double)availableFromOffsetFromUTC
{
  return self->_availableFromOffsetFromUTC;
}

- (NSString)unavailableBeforeReason
{
  return self->_unavailableBeforeReason;
}

- (NSString)unavailableAfterReason
{
  return self->_unavailableAfterReason;
}

- (NSString)unavailableActionReason
{
  return self->_unavailableActionReason;
}

- (NSString)unavailableActionTitle
{
  return self->_unavailableActionTitle;
}

- (NSString)unavailableActionURL
{
  return self->_unavailableActionURL;
}

- (unint64_t)unavailableActionBehavior
{
  return self->_unavailableActionBehavior;
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
}

- (NSString)serviceProviderLocalizedDisplayName
{
  return self->_serviceProviderLocalizedDisplayName;
}

- (void)setServiceProviderLocalizedDisplayName:(id)a3
{
}

- (NSString)serviceProviderCountryCode
{
  return self->_serviceProviderCountryCode;
}

- (void)setServiceProviderCountryCode:(id)a3
{
}

- (NSArray)serviceProviderAcceptedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (void)setServiceProviderAcceptedNetworks:(id)a3
{
}

- (NSSet)serviceProviderSupportedCountries
{
  return self->_serviceProviderSupportedCountries;
}

- (void)setServiceProviderSupportedCountries:(id)a3
{
}

- (unint64_t)serviceProviderCapabilities
{
  return self->_serviceProviderCapabilities;
}

- (void)setServiceProviderCapabilities:(unint64_t)a3
{
  self->_serviceProviderCapabilities = a3;
}

- (PKImage)image
{
  return self->_image;
}

- (int64_t)context
{
  return self->_context;
}

- (NSString)auxiliaryPassInformationIdentifier
{
  return self->_auxiliaryPassInformationIdentifier;
}

- (NSString)auxiliaryPassInformationItemIdentifier
{
  return self->_auxiliaryPassInformationItemIdentifier;
}

- (NSArray)purchaseNewActionItems
{
  return self->_purchaseNewActionItems;
}

- (NSDictionary)vehicleFunctionActions
{
  return self->_vehicleFunctionActions;
}

- (NSURL)externalURL
{
  return self->_externalURL;
}

- (double)availableFromRelative
{
  return self->_availableFromRelative;
}

- (void)setAvailableFromRelative:(double)a3
{
  self->_availableFromRelative = a3;
}

- (double)availableUntilRelative
{
  return self->_availableUntilRelative;
}

- (void)setAvailableUntilRelative:(double)a3
{
  self->_availableUntilRelative = a3;
}

- (PKAutoTopUpActionItem)autoTopUpItem
{
  return self->_autoTopUpItem;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (NSArray)selectedActionItems
{
  return self->_selectedActionItems;
}

- (PKEnteredValueActionItem)enteredValueItem
{
  return self->_enteredValueItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredValueItem, 0);
  objc_storeStrong((id *)&self->_selectedActionItems, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_autoTopUpItem, 0);
  objc_storeStrong((id *)&self->_externalURL, 0);
  objc_storeStrong((id *)&self->_vehicleFunctionActions, 0);
  objc_storeStrong((id *)&self->_purchaseNewActionItems, 0);
  objc_storeStrong((id *)&self->_auxiliaryPassInformationItemIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryPassInformationIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_serviceProviderSupportedCountries, 0);
  objc_storeStrong((id *)&self->_serviceProviderAcceptedNetworks, 0);
  objc_storeStrong((id *)&self->_serviceProviderCountryCode, 0);
  objc_storeStrong((id *)&self->_serviceProviderLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_unavailableActionURL, 0);
  objc_storeStrong((id *)&self->_unavailableActionTitle, 0);
  objc_storeStrong((id *)&self->_unavailableActionReason, 0);
  objc_storeStrong((id *)&self->_unavailableAfterReason, 0);
  objc_storeStrong((id *)&self->_unavailableBeforeReason, 0);
  objc_storeStrong((id *)&self->_associatedPlan, 0);
  objc_storeStrong((id *)&self->_associatedAutoTopUpIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedEnteredValueIdentifier, 0);
  objc_storeStrong((id *)&self->_relevantPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_confirmationTitle, 0);
  objc_storeStrong((id *)&self->_actionDescription, 0);
  objc_storeStrong((id *)&self->_appletData, 0);
  objc_storeStrong((id *)&self->_remoteContentConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_availableUntilRaw, 0);
  objc_storeStrong((id *)&self->_availableFromRaw, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_localizations, 0);
  objc_storeStrong((id *)&self->_rawDictionary, 0);
}

@end