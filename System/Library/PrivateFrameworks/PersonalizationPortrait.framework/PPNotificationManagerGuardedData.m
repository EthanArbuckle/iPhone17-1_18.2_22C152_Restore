@interface PPNotificationManagerGuardedData
- (id)description;
@end

@implementation PPNotificationManagerGuardedData

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suggestionsToken, 0);
  objc_storeStrong((id *)&self->_suggestionsHandler, 0);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
  objc_storeStrong((id *)&self->_calendarVisibilityManager, 0);
  objc_storeStrong((id *)&self->_calendarHandler, 0);
  objc_storeStrong((id *)&self->_ekStore, 0);
  objc_storeStrong((id *)&self->_eventKitToken, 0);
  objc_storeStrong((id *)&self->_eventKitHandler, 0);
  objc_storeStrong((id *)&self->_portraitInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_portraitChangeHandler, 0);
  objc_storeStrong((id *)&self->_meCardDonationToken, 0);
  objc_storeStrong((id *)&self->_meCardToken, 0);
  objc_storeStrong((id *)&self->_meCardHandler, 0);
  objc_storeStrong((id *)&self->_cnStore, 0);
  objc_storeStrong((id *)&self->_contactsToken, 0);
  objc_storeStrong((id *)&self->_contactsHandler, 0);
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [NSString alloc];
  long long v11 = *(_OWORD *)&self->_contactsToken;
  v10[0] = @"ct";
  v10[1] = @"cn";
  v10[2] = @"mt";
  v10[3] = @"md";
  meCardDonationToken = self->_meCardDonationToken;
  meCardToken = self->_meCardToken;
  v13 = meCardDonationToken;
  v10[4] = @"pct";
  v5 = [NSNumber numberWithInt:self->_portraitChangeToken];
  v14 = v5;
  v10[5] = @"pit";
  v6 = [NSNumber numberWithInt:self->_portraitInvalidationToken];
  v15 = v6;
  long long v16 = *(_OWORD *)&self->_eventKitToken;
  v10[6] = @"et";
  v10[7] = @"es";
  v10[8] = @"cvm";
  calendarVisibilityManager = self->_calendarVisibilityManager;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:v10 count:9];
  v8 = (void *)[v3 initWithFormat:@"<PPNotificationManagerGuardedData %@>", v7];

  return v8;
}

@end