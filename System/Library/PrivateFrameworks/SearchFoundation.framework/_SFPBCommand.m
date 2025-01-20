@interface _SFPBCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)backendData;
- (NSData)jsonData;
- (NSString)commandDetail;
- (_SFPBAddToPhotosLibraryCommand)addToPhotosLibraryCommand;
- (_SFPBBeginMapsRoutingCommand)beginMapsRoutingCommand;
- (_SFPBCallCommand)callCommand;
- (_SFPBClearProactiveCategoryCommand)clearProactiveCategoryCommand;
- (_SFPBCommand)initWithDictionary:(id)a3;
- (_SFPBCommand)initWithFacade:(id)a3;
- (_SFPBCommand)initWithJSON:(id)a3;
- (_SFPBCommandReference)commandReference;
- (_SFPBCopyCommand)copyCommand;
- (_SFPBCreateCalendarEventCommand)createCalendarEventCommand;
- (_SFPBCreateContactCommand)createContactCommand;
- (_SFPBCreateReminderCommand)createReminderCommand;
- (_SFPBEmailCommand)emailCommand;
- (_SFPBExecuteToolCommand)executeToolCommand;
- (_SFPBExpandInlineCommand)expandInlineCommand;
- (_SFPBFlightCheckinCommand)flightCheckinCommand;
- (_SFPBIndexedUserActivityCommand)indexedUserActivityCommand;
- (_SFPBInvokeSiriCommand)invokeSiriCommand;
- (_SFPBLaunchAppCommand)launchAppCommand;
- (_SFPBManageReservationCommand)manageReservationCommand;
- (_SFPBOpenAppClipCommand)openAppClipCommand;
- (_SFPBOpenCalculationCommand)openCalculationCommand;
- (_SFPBOpenCoreSpotlightItemCommand)openCoreSpotlightItemCommand;
- (_SFPBOpenFileProviderItemCommand)openFileProviderItemCommand;
- (_SFPBOpenMediaCommand)openMediaCommand;
- (_SFPBOpenPunchoutCommand)openPunchoutCommand;
- (_SFPBOpenWebClipCommand)openWebClipCommand;
- (_SFPBPerformContactActionCommand)performContactActionCommand;
- (_SFPBPerformContactQueryCommand)performContactQueryCommand;
- (_SFPBPerformEntityQueryCommand)performEntityQueryCommand;
- (_SFPBPerformIntentCommand)performIntentCommand;
- (_SFPBPerformPersonEntityQueryCommand)performPersonEntityQueryCommand;
- (_SFPBPlayMediaCommand)playMediaCommand;
- (_SFPBPlayVideoCommand)playVideoCommand;
- (_SFPBRejectPeopleInPhotoCommand)rejectPeopleInPhotoCommand;
- (_SFPBRequestAppClipInstallCommand)requestAppClipInstallCommand;
- (_SFPBRequestProductPageCommand)requestProductPageCommand;
- (_SFPBRequestUserReportCommand)requestUserReportCommand;
- (_SFPBRunVoiceShortcutCommand)runVoiceShortcutCommand;
- (_SFPBSearchInAppCommand)searchInAppCommand;
- (_SFPBSearchWebCommand)searchWebCommand;
- (_SFPBShareCommand)shareCommand;
- (_SFPBShowAppStoreSheetCommand)showAppStoreSheetCommand;
- (_SFPBShowContactCardCommand)showContactCardCommand;
- (_SFPBShowPhotosOneUpViewCommand)showPhotosOneUpViewCommand;
- (_SFPBShowPurchaseRequestSheetCommand)showPurchaseRequestSheetCommand;
- (_SFPBShowSFCardCommand)showSFCardCommand;
- (_SFPBShowScreenTimeRequestSheetCommand)showScreenTimeRequestSheetCommand;
- (_SFPBShowWrapperResponseViewCommand)showWrapperResponseViewCommand;
- (_SFPBSubscribeForUpdatesCommand)subscribeForUpdatesCommand;
- (_SFPBToggleAudioCommand)toggleAudioCommand;
- (_SFPBToggleWatchListStatusCommand)toggleWatchListStatusCommand;
- (_SFPBTopic)normalizedTopic;
- (_SFPBUpdateSearchQueryCommand)updateSearchQueryCommand;
- (_SFPBUpdateSportsFollowingStatusCommand)updateSportsFollowingStatusCommand;
- (_SFPBViewEmailCommand)viewEmailCommand;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichValue;
- (void)setAddToPhotosLibraryCommand:(id)a3;
- (void)setBackendData:(id)a3;
- (void)setBeginMapsRoutingCommand:(id)a3;
- (void)setCallCommand:(id)a3;
- (void)setClearProactiveCategoryCommand:(id)a3;
- (void)setCommandDetail:(id)a3;
- (void)setCommandReference:(id)a3;
- (void)setCopyCommand:(id)a3;
- (void)setCreateCalendarEventCommand:(id)a3;
- (void)setCreateContactCommand:(id)a3;
- (void)setCreateReminderCommand:(id)a3;
- (void)setEmailCommand:(id)a3;
- (void)setExecuteToolCommand:(id)a3;
- (void)setExpandInlineCommand:(id)a3;
- (void)setFlightCheckinCommand:(id)a3;
- (void)setIndexedUserActivityCommand:(id)a3;
- (void)setInvokeSiriCommand:(id)a3;
- (void)setLaunchAppCommand:(id)a3;
- (void)setManageReservationCommand:(id)a3;
- (void)setNormalizedTopic:(id)a3;
- (void)setOpenAppClipCommand:(id)a3;
- (void)setOpenCalculationCommand:(id)a3;
- (void)setOpenCoreSpotlightItemCommand:(id)a3;
- (void)setOpenFileProviderItemCommand:(id)a3;
- (void)setOpenMediaCommand:(id)a3;
- (void)setOpenPunchoutCommand:(id)a3;
- (void)setOpenWebClipCommand:(id)a3;
- (void)setPerformContactActionCommand:(id)a3;
- (void)setPerformContactQueryCommand:(id)a3;
- (void)setPerformEntityQueryCommand:(id)a3;
- (void)setPerformIntentCommand:(id)a3;
- (void)setPerformPersonEntityQueryCommand:(id)a3;
- (void)setPlayMediaCommand:(id)a3;
- (void)setPlayVideoCommand:(id)a3;
- (void)setRejectPeopleInPhotoCommand:(id)a3;
- (void)setRequestAppClipInstallCommand:(id)a3;
- (void)setRequestProductPageCommand:(id)a3;
- (void)setRequestUserReportCommand:(id)a3;
- (void)setRunVoiceShortcutCommand:(id)a3;
- (void)setSearchInAppCommand:(id)a3;
- (void)setSearchWebCommand:(id)a3;
- (void)setShareCommand:(id)a3;
- (void)setShowAppStoreSheetCommand:(id)a3;
- (void)setShowContactCardCommand:(id)a3;
- (void)setShowPhotosOneUpViewCommand:(id)a3;
- (void)setShowPurchaseRequestSheetCommand:(id)a3;
- (void)setShowSFCardCommand:(id)a3;
- (void)setShowScreenTimeRequestSheetCommand:(id)a3;
- (void)setShowWrapperResponseViewCommand:(id)a3;
- (void)setSubscribeForUpdatesCommand:(id)a3;
- (void)setToggleAudioCommand:(id)a3;
- (void)setToggleWatchListStatusCommand:(id)a3;
- (void)setUpdateSearchQueryCommand:(id)a3;
- (void)setUpdateSportsFollowingStatusCommand:(id)a3;
- (void)setViewEmailCommand:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCommand

- (_SFPBCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCommand *)self init];

  if (v5)
  {
    v6 = [v4 commandDetail];

    if (v6)
    {
      v7 = [v4 commandDetail];
      [(_SFPBCommand *)v5 setCommandDetail:v7];
    }
    v8 = [v4 normalizedTopic];

    if (v8)
    {
      v9 = [_SFPBTopic alloc];
      v10 = [v4 normalizedTopic];
      v11 = [(_SFPBTopic *)v9 initWithSFTopic:v10];
      [(_SFPBCommand *)v5 setNormalizedTopic:v11];
    }
    v12 = [v4 backendData];

    if (v12)
    {
      v13 = [v4 backendData];
      [(_SFPBCommand *)v5 setBackendData:v13];
    }
    v14 = [v4 commandReference];

    if (v14)
    {
      v15 = [_SFPBCommandReference alloc];
      v16 = [v4 commandReference];
      v17 = [(_SFPBCommandReference *)v15 initWithFacade:v16];
      [(_SFPBCommand *)v5 setCommandReference:v17];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[_SFPBShowContactCardCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setShowContactCardCommand:v18];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[_SFPBShowSFCardCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setShowSFCardCommand:v19];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[_SFPBShowAppStoreSheetCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setShowAppStoreSheetCommand:v20];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[_SFPBOpenPunchoutCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setOpenPunchoutCommand:v21];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[_SFPBOpenFileProviderItemCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setOpenFileProviderItemCommand:v22];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [[_SFPBOpenAppClipCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setOpenAppClipCommand:v23];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[_SFPBOpenWebClipCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setOpenWebClipCommand:v24];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBRequestAppClipInstallCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setRequestAppClipInstallCommand:v25];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[_SFPBRequestUserReportCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setRequestUserReportCommand:v26];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBLaunchAppCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setLaunchAppCommand:v27];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[_SFPBRunVoiceShortcutCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setRunVoiceShortcutCommand:v28];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBIndexedUserActivityCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setIndexedUserActivityCommand:v29];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[_SFPBOpenCoreSpotlightItemCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setOpenCoreSpotlightItemCommand:v30];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBPerformIntentCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setPerformIntentCommand:v31];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [[_SFPBSearchInAppCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setSearchInAppCommand:v32];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBUpdateSearchQueryCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setUpdateSearchQueryCommand:v33];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[_SFPBSearchWebCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setSearchWebCommand:v34];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBInvokeSiriCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setInvokeSiriCommand:v35];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[_SFPBPerformContactQueryCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setPerformContactQueryCommand:v36];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBOpenCalculationCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setOpenCalculationCommand:v37];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [[_SFPBPlayVideoCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setPlayVideoCommand:v38];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[_SFPBCallCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setCallCommand:v39];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[_SFPBEmailCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setEmailCommand:v40];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = [[_SFPBBeginMapsRoutingCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setBeginMapsRoutingCommand:v41];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = [[_SFPBToggleAudioCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setToggleAudioCommand:v42];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [[_SFPBPerformPersonEntityQueryCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setPerformPersonEntityQueryCommand:v43];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [[_SFPBShowPurchaseRequestSheetCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setShowPurchaseRequestSheetCommand:v44];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [[_SFPBShowScreenTimeRequestSheetCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setShowScreenTimeRequestSheetCommand:v45];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = [[_SFPBPerformEntityQueryCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setPerformEntityQueryCommand:v46];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = [[_SFPBShareCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setShareCommand:v47];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v48 = [[_SFPBCopyCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setCopyCommand:v48];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [[_SFPBToggleWatchListStatusCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setToggleWatchListStatusCommand:v49];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v50 = [[_SFPBShowPhotosOneUpViewCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setShowPhotosOneUpViewCommand:v50];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51 = [[_SFPBPlayMediaCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setPlayMediaCommand:v51];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = [[_SFPBOpenMediaCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setOpenMediaCommand:v52];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v53 = [[_SFPBAddToPhotosLibraryCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setAddToPhotosLibraryCommand:v53];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v54 = [[_SFPBPerformContactActionCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setPerformContactActionCommand:v54];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v55 = [[_SFPBExpandInlineCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setExpandInlineCommand:v55];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v56 = [[_SFPBSubscribeForUpdatesCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setSubscribeForUpdatesCommand:v56];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = [[_SFPBViewEmailCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setViewEmailCommand:v57];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v58 = [[_SFPBRejectPeopleInPhotoCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setRejectPeopleInPhotoCommand:v58];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v59 = [[_SFPBShowWrapperResponseViewCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setShowWrapperResponseViewCommand:v59];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v60 = [[_SFPBClearProactiveCategoryCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setClearProactiveCategoryCommand:v60];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v61 = [[_SFPBCreateContactCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setCreateContactCommand:v61];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v62 = [[_SFPBCreateCalendarEventCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setCreateCalendarEventCommand:v62];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v63 = [[_SFPBCreateReminderCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setCreateReminderCommand:v63];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v64 = [[_SFPBManageReservationCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setManageReservationCommand:v64];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v65 = [[_SFPBUpdateSportsFollowingStatusCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setUpdateSportsFollowingStatusCommand:v65];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v66 = [[_SFPBRequestProductPageCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setRequestProductPageCommand:v66];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v67 = [[_SFPBFlightCheckinCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setFlightCheckinCommand:v67];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v68 = [[_SFPBExecuteToolCommand alloc] initWithFacade:v4];
      [(_SFPBCommand *)v5 setExecuteToolCommand:v68];
    }
    v69 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReference, 0);
  objc_storeStrong((id *)&self->_backendData, 0);
  objc_storeStrong((id *)&self->_normalizedTopic, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
  objc_storeStrong((id *)&self->_executeToolCommand, 0);
  objc_storeStrong((id *)&self->_flightCheckinCommand, 0);
  objc_storeStrong((id *)&self->_requestProductPageCommand, 0);
  objc_storeStrong((id *)&self->_updateSportsFollowingStatusCommand, 0);
  objc_storeStrong((id *)&self->_manageReservationCommand, 0);
  objc_storeStrong((id *)&self->_createReminderCommand, 0);
  objc_storeStrong((id *)&self->_createCalendarEventCommand, 0);
  objc_storeStrong((id *)&self->_createContactCommand, 0);
  objc_storeStrong((id *)&self->_clearProactiveCategoryCommand, 0);
  objc_storeStrong((id *)&self->_showWrapperResponseViewCommand, 0);
  objc_storeStrong((id *)&self->_rejectPeopleInPhotoCommand, 0);
  objc_storeStrong((id *)&self->_viewEmailCommand, 0);
  objc_storeStrong((id *)&self->_subscribeForUpdatesCommand, 0);
  objc_storeStrong((id *)&self->_expandInlineCommand, 0);
  objc_storeStrong((id *)&self->_performContactActionCommand, 0);
  objc_storeStrong((id *)&self->_addToPhotosLibraryCommand, 0);
  objc_storeStrong((id *)&self->_openMediaCommand, 0);
  objc_storeStrong((id *)&self->_playMediaCommand, 0);
  objc_storeStrong((id *)&self->_showPhotosOneUpViewCommand, 0);
  objc_storeStrong((id *)&self->_toggleWatchListStatusCommand, 0);
  objc_storeStrong((id *)&self->_copyCommand, 0);
  objc_storeStrong((id *)&self->_shareCommand, 0);
  objc_storeStrong((id *)&self->_performEntityQueryCommand, 0);
  objc_storeStrong((id *)&self->_showScreenTimeRequestSheetCommand, 0);
  objc_storeStrong((id *)&self->_showPurchaseRequestSheetCommand, 0);
  objc_storeStrong((id *)&self->_performPersonEntityQueryCommand, 0);
  objc_storeStrong((id *)&self->_toggleAudioCommand, 0);
  objc_storeStrong((id *)&self->_beginMapsRoutingCommand, 0);
  objc_storeStrong((id *)&self->_emailCommand, 0);
  objc_storeStrong((id *)&self->_callCommand, 0);
  objc_storeStrong((id *)&self->_playVideoCommand, 0);
  objc_storeStrong((id *)&self->_openCalculationCommand, 0);
  objc_storeStrong((id *)&self->_performContactQueryCommand, 0);
  objc_storeStrong((id *)&self->_invokeSiriCommand, 0);
  objc_storeStrong((id *)&self->_searchWebCommand, 0);
  objc_storeStrong((id *)&self->_updateSearchQueryCommand, 0);
  objc_storeStrong((id *)&self->_searchInAppCommand, 0);
  objc_storeStrong((id *)&self->_performIntentCommand, 0);
  objc_storeStrong((id *)&self->_openCoreSpotlightItemCommand, 0);
  objc_storeStrong((id *)&self->_indexedUserActivityCommand, 0);
  objc_storeStrong((id *)&self->_runVoiceShortcutCommand, 0);
  objc_storeStrong((id *)&self->_launchAppCommand, 0);
  objc_storeStrong((id *)&self->_requestUserReportCommand, 0);
  objc_storeStrong((id *)&self->_requestAppClipInstallCommand, 0);
  objc_storeStrong((id *)&self->_openWebClipCommand, 0);
  objc_storeStrong((id *)&self->_openAppClipCommand, 0);
  objc_storeStrong((id *)&self->_openFileProviderItemCommand, 0);
  objc_storeStrong((id *)&self->_openPunchoutCommand, 0);
  objc_storeStrong((id *)&self->_showAppStoreSheetCommand, 0);
  objc_storeStrong((id *)&self->_showSFCardCommand, 0);
  objc_storeStrong((id *)&self->_showContactCardCommand, 0);
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (_SFPBCommandReference)commandReference
{
  return self->_commandReference;
}

- (NSData)backendData
{
  return self->_backendData;
}

- (_SFPBTopic)normalizedTopic
{
  return self->_normalizedTopic;
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (_SFPBCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v166.receiver = self;
  v166.super_class = (Class)_SFPBCommand;
  v5 = [(_SFPBCommand *)&v166 init];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"showContactCardCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBShowContactCardCommand alloc] initWithDictionary:v6];
      [(_SFPBCommand *)v5 setShowContactCardCommand:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"showSFCardCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBShowSFCardCommand alloc] initWithDictionary:v8];
      [(_SFPBCommand *)v5 setShowSFCardCommand:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"showAppStoreSheetCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBShowAppStoreSheetCommand alloc] initWithDictionary:v10];
      [(_SFPBCommand *)v5 setShowAppStoreSheetCommand:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"openPunchoutCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBOpenPunchoutCommand alloc] initWithDictionary:v12];
      [(_SFPBCommand *)v5 setOpenPunchoutCommand:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"openFileProviderItemCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBOpenFileProviderItemCommand alloc] initWithDictionary:v14];
      [(_SFPBCommand *)v5 setOpenFileProviderItemCommand:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"openAppClipCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[_SFPBOpenAppClipCommand alloc] initWithDictionary:v16];
      [(_SFPBCommand *)v5 setOpenAppClipCommand:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"openWebClipCommand"];
    objc_opt_class();
    v165 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      v19 = [[_SFPBOpenWebClipCommand alloc] initWithDictionary:v18];
      [(_SFPBCommand *)v5 setOpenWebClipCommand:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"requestAppClipInstallCommand"];
    objc_opt_class();
    v164 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      v21 = [[_SFPBRequestAppClipInstallCommand alloc] initWithDictionary:v20];
      [(_SFPBCommand *)v5 setRequestAppClipInstallCommand:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"requestUserReportCommand"];
    objc_opt_class();
    v163 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = [[_SFPBRequestUserReportCommand alloc] initWithDictionary:v22];
      [(_SFPBCommand *)v5 setRequestUserReportCommand:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"launchAppCommand"];
    objc_opt_class();
    v162 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBLaunchAppCommand alloc] initWithDictionary:v24];
      [(_SFPBCommand *)v5 setLaunchAppCommand:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"runVoiceShortcutCommand"];
    objc_opt_class();
    v161 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRunVoiceShortcutCommand alloc] initWithDictionary:v26];
      [(_SFPBCommand *)v5 setRunVoiceShortcutCommand:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"indexedUserActivityCommand"];
    objc_opt_class();
    v160 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBIndexedUserActivityCommand alloc] initWithDictionary:v28];
      [(_SFPBCommand *)v5 setIndexedUserActivityCommand:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"openCoreSpotlightItemCommand"];
    objc_opt_class();
    v159 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBOpenCoreSpotlightItemCommand alloc] initWithDictionary:v30];
      [(_SFPBCommand *)v5 setOpenCoreSpotlightItemCommand:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"performIntentCommand"];
    objc_opt_class();
    v158 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBPerformIntentCommand alloc] initWithDictionary:v32];
      [(_SFPBCommand *)v5 setPerformIntentCommand:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"searchInAppCommand"];
    objc_opt_class();
    v157 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBSearchInAppCommand alloc] initWithDictionary:v34];
      [(_SFPBCommand *)v5 setSearchInAppCommand:v35];
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"updateSearchQueryCommand"];
    objc_opt_class();
    v156 = (void *)v36;
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBUpdateSearchQueryCommand alloc] initWithDictionary:v36];
      [(_SFPBCommand *)v5 setUpdateSearchQueryCommand:v37];
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"searchWebCommand"];
    objc_opt_class();
    v155 = (void *)v38;
    if (objc_opt_isKindOfClass())
    {
      v39 = [[_SFPBSearchWebCommand alloc] initWithDictionary:v38];
      [(_SFPBCommand *)v5 setSearchWebCommand:v39];
    }
    uint64_t v40 = [v4 objectForKeyedSubscript:@"invokeSiriCommand"];
    objc_opt_class();
    v154 = (void *)v40;
    if (objc_opt_isKindOfClass())
    {
      v41 = [[_SFPBInvokeSiriCommand alloc] initWithDictionary:v40];
      [(_SFPBCommand *)v5 setInvokeSiriCommand:v41];
    }
    uint64_t v42 = [v4 objectForKeyedSubscript:@"performContactQueryCommand"];
    objc_opt_class();
    v153 = (void *)v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = [[_SFPBPerformContactQueryCommand alloc] initWithDictionary:v42];
      [(_SFPBCommand *)v5 setPerformContactQueryCommand:v43];
    }
    uint64_t v44 = [v4 objectForKeyedSubscript:@"openCalculationCommand"];
    objc_opt_class();
    v152 = (void *)v44;
    if (objc_opt_isKindOfClass())
    {
      v45 = [[_SFPBOpenCalculationCommand alloc] initWithDictionary:v44];
      [(_SFPBCommand *)v5 setOpenCalculationCommand:v45];
    }
    uint64_t v46 = [v4 objectForKeyedSubscript:@"playVideoCommand"];
    objc_opt_class();
    v151 = (void *)v46;
    if (objc_opt_isKindOfClass())
    {
      v47 = [[_SFPBPlayVideoCommand alloc] initWithDictionary:v46];
      [(_SFPBCommand *)v5 setPlayVideoCommand:v47];
    }
    uint64_t v48 = [v4 objectForKeyedSubscript:@"callCommand"];
    objc_opt_class();
    v150 = (void *)v48;
    if (objc_opt_isKindOfClass())
    {
      v49 = [[_SFPBCallCommand alloc] initWithDictionary:v48];
      [(_SFPBCommand *)v5 setCallCommand:v49];
    }
    uint64_t v50 = [v4 objectForKeyedSubscript:@"emailCommand"];
    objc_opt_class();
    v149 = (void *)v50;
    if (objc_opt_isKindOfClass())
    {
      v51 = [[_SFPBEmailCommand alloc] initWithDictionary:v50];
      [(_SFPBCommand *)v5 setEmailCommand:v51];
    }
    uint64_t v52 = [v4 objectForKeyedSubscript:@"beginMapsRoutingCommand"];
    objc_opt_class();
    v148 = (void *)v52;
    if (objc_opt_isKindOfClass())
    {
      v53 = [[_SFPBBeginMapsRoutingCommand alloc] initWithDictionary:v52];
      [(_SFPBCommand *)v5 setBeginMapsRoutingCommand:v53];
    }
    uint64_t v54 = [v4 objectForKeyedSubscript:@"toggleAudioCommand"];
    objc_opt_class();
    v147 = (void *)v54;
    if (objc_opt_isKindOfClass())
    {
      v55 = [[_SFPBToggleAudioCommand alloc] initWithDictionary:v54];
      [(_SFPBCommand *)v5 setToggleAudioCommand:v55];
    }
    uint64_t v56 = [v4 objectForKeyedSubscript:@"performPersonEntityQueryCommand"];
    objc_opt_class();
    v146 = (void *)v56;
    if (objc_opt_isKindOfClass())
    {
      v57 = [[_SFPBPerformPersonEntityQueryCommand alloc] initWithDictionary:v56];
      [(_SFPBCommand *)v5 setPerformPersonEntityQueryCommand:v57];
    }
    uint64_t v58 = [v4 objectForKeyedSubscript:@"showPurchaseRequestSheetCommand"];
    objc_opt_class();
    v145 = (void *)v58;
    if (objc_opt_isKindOfClass())
    {
      v59 = [[_SFPBShowPurchaseRequestSheetCommand alloc] initWithDictionary:v58];
      [(_SFPBCommand *)v5 setShowPurchaseRequestSheetCommand:v59];
    }
    uint64_t v60 = [v4 objectForKeyedSubscript:@"showScreenTimeRequestSheetCommand"];
    objc_opt_class();
    v144 = (void *)v60;
    if (objc_opt_isKindOfClass())
    {
      v61 = [[_SFPBShowScreenTimeRequestSheetCommand alloc] initWithDictionary:v60];
      [(_SFPBCommand *)v5 setShowScreenTimeRequestSheetCommand:v61];
    }
    uint64_t v62 = [v4 objectForKeyedSubscript:@"performEntityQueryCommand"];
    objc_opt_class();
    v143 = (void *)v62;
    if (objc_opt_isKindOfClass())
    {
      v63 = [[_SFPBPerformEntityQueryCommand alloc] initWithDictionary:v62];
      [(_SFPBCommand *)v5 setPerformEntityQueryCommand:v63];
    }
    uint64_t v64 = [v4 objectForKeyedSubscript:@"shareCommand"];
    objc_opt_class();
    v142 = (void *)v64;
    if (objc_opt_isKindOfClass())
    {
      v65 = [[_SFPBShareCommand alloc] initWithDictionary:v64];
      [(_SFPBCommand *)v5 setShareCommand:v65];
    }
    uint64_t v66 = [v4 objectForKeyedSubscript:@"copyCommand"];
    objc_opt_class();
    v141 = (void *)v66;
    if (objc_opt_isKindOfClass())
    {
      v67 = [[_SFPBCopyCommand alloc] initWithDictionary:v66];
      [(_SFPBCommand *)v5 setCopyCommand:v67];
    }
    uint64_t v68 = [v4 objectForKeyedSubscript:@"toggleWatchListStatusCommand"];
    objc_opt_class();
    v140 = (void *)v68;
    if (objc_opt_isKindOfClass())
    {
      v69 = [[_SFPBToggleWatchListStatusCommand alloc] initWithDictionary:v68];
      [(_SFPBCommand *)v5 setToggleWatchListStatusCommand:v69];
    }
    uint64_t v70 = [v4 objectForKeyedSubscript:@"showPhotosOneUpViewCommand"];
    objc_opt_class();
    v139 = (void *)v70;
    if (objc_opt_isKindOfClass())
    {
      v71 = [[_SFPBShowPhotosOneUpViewCommand alloc] initWithDictionary:v70];
      [(_SFPBCommand *)v5 setShowPhotosOneUpViewCommand:v71];
    }
    uint64_t v72 = [v4 objectForKeyedSubscript:@"playMediaCommand"];
    objc_opt_class();
    v138 = (void *)v72;
    if (objc_opt_isKindOfClass())
    {
      v73 = [[_SFPBPlayMediaCommand alloc] initWithDictionary:v72];
      [(_SFPBCommand *)v5 setPlayMediaCommand:v73];
    }
    uint64_t v74 = [v4 objectForKeyedSubscript:@"openMediaCommand"];
    objc_opt_class();
    v137 = (void *)v74;
    if (objc_opt_isKindOfClass())
    {
      v75 = [[_SFPBOpenMediaCommand alloc] initWithDictionary:v74];
      [(_SFPBCommand *)v5 setOpenMediaCommand:v75];
    }
    uint64_t v76 = [v4 objectForKeyedSubscript:@"addToPhotosLibraryCommand"];
    objc_opt_class();
    v136 = (void *)v76;
    if (objc_opt_isKindOfClass())
    {
      v77 = [[_SFPBAddToPhotosLibraryCommand alloc] initWithDictionary:v76];
      [(_SFPBCommand *)v5 setAddToPhotosLibraryCommand:v77];
    }
    uint64_t v78 = [v4 objectForKeyedSubscript:@"performContactActionCommand"];
    objc_opt_class();
    v135 = (void *)v78;
    if (objc_opt_isKindOfClass())
    {
      v79 = [[_SFPBPerformContactActionCommand alloc] initWithDictionary:v78];
      [(_SFPBCommand *)v5 setPerformContactActionCommand:v79];
    }
    uint64_t v80 = [v4 objectForKeyedSubscript:@"expandInlineCommand"];
    objc_opt_class();
    v134 = (void *)v80;
    if (objc_opt_isKindOfClass())
    {
      v81 = [[_SFPBExpandInlineCommand alloc] initWithDictionary:v80];
      [(_SFPBCommand *)v5 setExpandInlineCommand:v81];
    }
    uint64_t v82 = [v4 objectForKeyedSubscript:@"subscribeForUpdatesCommand"];
    objc_opt_class();
    v133 = (void *)v82;
    if (objc_opt_isKindOfClass())
    {
      v83 = [[_SFPBSubscribeForUpdatesCommand alloc] initWithDictionary:v82];
      [(_SFPBCommand *)v5 setSubscribeForUpdatesCommand:v83];
    }
    uint64_t v84 = [v4 objectForKeyedSubscript:@"viewEmailCommand"];
    objc_opt_class();
    v132 = (void *)v84;
    if (objc_opt_isKindOfClass())
    {
      v85 = [[_SFPBViewEmailCommand alloc] initWithDictionary:v84];
      [(_SFPBCommand *)v5 setViewEmailCommand:v85];
    }
    uint64_t v86 = [v4 objectForKeyedSubscript:@"rejectPeopleInPhotoCommand"];
    objc_opt_class();
    v131 = (void *)v86;
    if (objc_opt_isKindOfClass())
    {
      v87 = [[_SFPBRejectPeopleInPhotoCommand alloc] initWithDictionary:v86];
      [(_SFPBCommand *)v5 setRejectPeopleInPhotoCommand:v87];
    }
    uint64_t v88 = [v4 objectForKeyedSubscript:@"showWrapperResponseViewCommand"];
    objc_opt_class();
    v130 = (void *)v88;
    if (objc_opt_isKindOfClass())
    {
      v89 = [[_SFPBShowWrapperResponseViewCommand alloc] initWithDictionary:v88];
      [(_SFPBCommand *)v5 setShowWrapperResponseViewCommand:v89];
    }
    uint64_t v90 = [v4 objectForKeyedSubscript:@"clearProactiveCategoryCommand"];
    objc_opt_class();
    v129 = (void *)v90;
    if (objc_opt_isKindOfClass())
    {
      v91 = [[_SFPBClearProactiveCategoryCommand alloc] initWithDictionary:v90];
      [(_SFPBCommand *)v5 setClearProactiveCategoryCommand:v91];
    }
    uint64_t v92 = [v4 objectForKeyedSubscript:@"createContactCommand"];
    objc_opt_class();
    v128 = (void *)v92;
    if (objc_opt_isKindOfClass())
    {
      v93 = [[_SFPBCreateContactCommand alloc] initWithDictionary:v92];
      [(_SFPBCommand *)v5 setCreateContactCommand:v93];
    }
    uint64_t v94 = [v4 objectForKeyedSubscript:@"createCalendarEventCommand"];
    objc_opt_class();
    v127 = (void *)v94;
    if (objc_opt_isKindOfClass())
    {
      v95 = [[_SFPBCreateCalendarEventCommand alloc] initWithDictionary:v94];
      [(_SFPBCommand *)v5 setCreateCalendarEventCommand:v95];
    }
    uint64_t v96 = [v4 objectForKeyedSubscript:@"createReminderCommand"];
    objc_opt_class();
    v126 = (void *)v96;
    if (objc_opt_isKindOfClass())
    {
      v97 = [[_SFPBCreateReminderCommand alloc] initWithDictionary:v96];
      [(_SFPBCommand *)v5 setCreateReminderCommand:v97];
    }
    uint64_t v98 = [v4 objectForKeyedSubscript:@"manageReservationCommand"];
    objc_opt_class();
    v125 = (void *)v98;
    if (objc_opt_isKindOfClass())
    {
      v99 = [[_SFPBManageReservationCommand alloc] initWithDictionary:v98];
      [(_SFPBCommand *)v5 setManageReservationCommand:v99];
    }
    v124 = (void *)v6;
    uint64_t v100 = [v4 objectForKeyedSubscript:@"updateSportsFollowingStatusCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v101 = [[_SFPBUpdateSportsFollowingStatusCommand alloc] initWithDictionary:v100];
      [(_SFPBCommand *)v5 setUpdateSportsFollowingStatusCommand:v101];
    }
    v118 = (void *)v100;
    v123 = (void *)v8;
    v102 = [v4 objectForKeyedSubscript:@"requestProductPageCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v103 = [[_SFPBRequestProductPageCommand alloc] initWithDictionary:v102];
      [(_SFPBCommand *)v5 setRequestProductPageCommand:v103];
    }
    v122 = (void *)v10;
    v104 = [v4 objectForKeyedSubscript:@"flightCheckinCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v105 = [[_SFPBFlightCheckinCommand alloc] initWithDictionary:v104];
      [(_SFPBCommand *)v5 setFlightCheckinCommand:v105];
    }
    v119 = (void *)v16;
    v121 = (void *)v12;
    v106 = [v4 objectForKeyedSubscript:@"executeToolCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v107 = [[_SFPBExecuteToolCommand alloc] initWithDictionary:v106];
      [(_SFPBCommand *)v5 setExecuteToolCommand:v107];
    }
    v120 = (void *)v14;
    v108 = [v4 objectForKeyedSubscript:@"commandDetail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v109 = (void *)[v108 copy];
      [(_SFPBCommand *)v5 setCommandDetail:v109];
    }
    v110 = [v4 objectForKeyedSubscript:@"normalizedTopic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v111 = [[_SFPBTopic alloc] initWithDictionary:v110];
      [(_SFPBCommand *)v5 setNormalizedTopic:v111];
    }
    v112 = [v4 objectForKeyedSubscript:@"backendData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v113 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v112 options:0];
      [(_SFPBCommand *)v5 setBackendData:v113];
    }
    v114 = [v4 objectForKeyedSubscript:@"commandReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v115 = [[_SFPBCommandReference alloc] initWithDictionary:v114];
      [(_SFPBCommand *)v5 setCommandReference:v115];
    }
    v116 = v5;
  }
  return v5;
}

- (_SFPBCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCommand *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_addToPhotosLibraryCommand)
  {
    id v4 = [(_SFPBCommand *)self addToPhotosLibraryCommand];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"addToPhotosLibraryCommand"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"addToPhotosLibraryCommand"];
    }
  }
  if (self->_backendData)
  {
    uint64_t v7 = [(_SFPBCommand *)self backendData];
    uint64_t v8 = [v7 base64EncodedStringWithOptions:0];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"backendData"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"backendData"];
    }
  }
  if (self->_beginMapsRoutingCommand)
  {
    uint64_t v10 = [(_SFPBCommand *)self beginMapsRoutingCommand];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"beginMapsRoutingCommand"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"beginMapsRoutingCommand"];
    }
  }
  if (self->_callCommand)
  {
    v13 = [(_SFPBCommand *)self callCommand];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"callCommand"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"callCommand"];
    }
  }
  if (self->_clearProactiveCategoryCommand)
  {
    uint64_t v16 = [(_SFPBCommand *)self clearProactiveCategoryCommand];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"clearProactiveCategoryCommand"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"clearProactiveCategoryCommand"];
    }
  }
  if (self->_commandDetail)
  {
    v19 = [(_SFPBCommand *)self commandDetail];
    uint64_t v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"commandDetail"];
  }
  if (self->_commandReference)
  {
    v21 = [(_SFPBCommand *)self commandReference];
    uint64_t v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"commandReference"];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"commandReference"];
    }
  }
  if (self->_copyCommand)
  {
    uint64_t v24 = [(_SFPBCommand *)self copyCommand];
    v25 = [(_SFPBCopyCommand *)v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"copyCommand"];
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"copyCommand"];
    }
  }
  if (self->_createCalendarEventCommand)
  {
    v27 = [(_SFPBCommand *)self createCalendarEventCommand];
    uint64_t v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"createCalendarEventCommand"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"createCalendarEventCommand"];
    }
  }
  if (self->_createContactCommand)
  {
    uint64_t v30 = [(_SFPBCommand *)self createContactCommand];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"createContactCommand"];
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"createContactCommand"];
    }
  }
  if (self->_createReminderCommand)
  {
    v33 = [(_SFPBCommand *)self createReminderCommand];
    uint64_t v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"createReminderCommand"];
    }
    else
    {
      v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"createReminderCommand"];
    }
  }
  if (self->_emailCommand)
  {
    uint64_t v36 = [(_SFPBCommand *)self emailCommand];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"emailCommand"];
    }
    else
    {
      uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"emailCommand"];
    }
  }
  if (self->_executeToolCommand)
  {
    v39 = [(_SFPBCommand *)self executeToolCommand];
    uint64_t v40 = [v39 dictionaryRepresentation];
    if (v40)
    {
      [v3 setObject:v40 forKeyedSubscript:@"executeToolCommand"];
    }
    else
    {
      v41 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v41 forKeyedSubscript:@"executeToolCommand"];
    }
  }
  if (self->_expandInlineCommand)
  {
    uint64_t v42 = [(_SFPBCommand *)self expandInlineCommand];
    v43 = [v42 dictionaryRepresentation];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"expandInlineCommand"];
    }
    else
    {
      uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v44 forKeyedSubscript:@"expandInlineCommand"];
    }
  }
  if (self->_flightCheckinCommand)
  {
    v45 = [(_SFPBCommand *)self flightCheckinCommand];
    uint64_t v46 = [v45 dictionaryRepresentation];
    if (v46)
    {
      [v3 setObject:v46 forKeyedSubscript:@"flightCheckinCommand"];
    }
    else
    {
      v47 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v47 forKeyedSubscript:@"flightCheckinCommand"];
    }
  }
  if (self->_indexedUserActivityCommand)
  {
    uint64_t v48 = [(_SFPBCommand *)self indexedUserActivityCommand];
    v49 = [v48 dictionaryRepresentation];
    if (v49)
    {
      [v3 setObject:v49 forKeyedSubscript:@"indexedUserActivityCommand"];
    }
    else
    {
      uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v50 forKeyedSubscript:@"indexedUserActivityCommand"];
    }
  }
  if (self->_invokeSiriCommand)
  {
    v51 = [(_SFPBCommand *)self invokeSiriCommand];
    uint64_t v52 = [v51 dictionaryRepresentation];
    if (v52)
    {
      [v3 setObject:v52 forKeyedSubscript:@"invokeSiriCommand"];
    }
    else
    {
      v53 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v53 forKeyedSubscript:@"invokeSiriCommand"];
    }
  }
  if (self->_launchAppCommand)
  {
    uint64_t v54 = [(_SFPBCommand *)self launchAppCommand];
    v55 = [v54 dictionaryRepresentation];
    if (v55)
    {
      [v3 setObject:v55 forKeyedSubscript:@"launchAppCommand"];
    }
    else
    {
      uint64_t v56 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v56 forKeyedSubscript:@"launchAppCommand"];
    }
  }
  if (self->_manageReservationCommand)
  {
    v57 = [(_SFPBCommand *)self manageReservationCommand];
    uint64_t v58 = [v57 dictionaryRepresentation];
    if (v58)
    {
      [v3 setObject:v58 forKeyedSubscript:@"manageReservationCommand"];
    }
    else
    {
      v59 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v59 forKeyedSubscript:@"manageReservationCommand"];
    }
  }
  if (self->_normalizedTopic)
  {
    uint64_t v60 = [(_SFPBCommand *)self normalizedTopic];
    v61 = [v60 dictionaryRepresentation];
    if (v61)
    {
      [v3 setObject:v61 forKeyedSubscript:@"normalizedTopic"];
    }
    else
    {
      uint64_t v62 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v62 forKeyedSubscript:@"normalizedTopic"];
    }
  }
  if (self->_openAppClipCommand)
  {
    v63 = [(_SFPBCommand *)self openAppClipCommand];
    uint64_t v64 = [v63 dictionaryRepresentation];
    if (v64)
    {
      [v3 setObject:v64 forKeyedSubscript:@"openAppClipCommand"];
    }
    else
    {
      v65 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v65 forKeyedSubscript:@"openAppClipCommand"];
    }
  }
  if (self->_openCalculationCommand)
  {
    uint64_t v66 = [(_SFPBCommand *)self openCalculationCommand];
    v67 = [v66 dictionaryRepresentation];
    if (v67)
    {
      [v3 setObject:v67 forKeyedSubscript:@"openCalculationCommand"];
    }
    else
    {
      uint64_t v68 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v68 forKeyedSubscript:@"openCalculationCommand"];
    }
  }
  if (self->_openCoreSpotlightItemCommand)
  {
    v69 = [(_SFPBCommand *)self openCoreSpotlightItemCommand];
    uint64_t v70 = [v69 dictionaryRepresentation];
    if (v70)
    {
      [v3 setObject:v70 forKeyedSubscript:@"openCoreSpotlightItemCommand"];
    }
    else
    {
      v71 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v71 forKeyedSubscript:@"openCoreSpotlightItemCommand"];
    }
  }
  if (self->_openFileProviderItemCommand)
  {
    uint64_t v72 = [(_SFPBCommand *)self openFileProviderItemCommand];
    v73 = [v72 dictionaryRepresentation];
    if (v73)
    {
      [v3 setObject:v73 forKeyedSubscript:@"openFileProviderItemCommand"];
    }
    else
    {
      uint64_t v74 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v74 forKeyedSubscript:@"openFileProviderItemCommand"];
    }
  }
  if (self->_openMediaCommand)
  {
    v75 = [(_SFPBCommand *)self openMediaCommand];
    uint64_t v76 = [v75 dictionaryRepresentation];
    if (v76)
    {
      [v3 setObject:v76 forKeyedSubscript:@"openMediaCommand"];
    }
    else
    {
      v77 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v77 forKeyedSubscript:@"openMediaCommand"];
    }
  }
  if (self->_openPunchoutCommand)
  {
    uint64_t v78 = [(_SFPBCommand *)self openPunchoutCommand];
    v79 = [v78 dictionaryRepresentation];
    if (v79)
    {
      [v3 setObject:v79 forKeyedSubscript:@"openPunchoutCommand"];
    }
    else
    {
      uint64_t v80 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v80 forKeyedSubscript:@"openPunchoutCommand"];
    }
  }
  if (self->_openWebClipCommand)
  {
    v81 = [(_SFPBCommand *)self openWebClipCommand];
    uint64_t v82 = [v81 dictionaryRepresentation];
    if (v82)
    {
      [v3 setObject:v82 forKeyedSubscript:@"openWebClipCommand"];
    }
    else
    {
      v83 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v83 forKeyedSubscript:@"openWebClipCommand"];
    }
  }
  if (self->_performContactActionCommand)
  {
    uint64_t v84 = [(_SFPBCommand *)self performContactActionCommand];
    v85 = [v84 dictionaryRepresentation];
    if (v85)
    {
      [v3 setObject:v85 forKeyedSubscript:@"performContactActionCommand"];
    }
    else
    {
      uint64_t v86 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v86 forKeyedSubscript:@"performContactActionCommand"];
    }
  }
  if (self->_performContactQueryCommand)
  {
    v87 = [(_SFPBCommand *)self performContactQueryCommand];
    uint64_t v88 = [v87 dictionaryRepresentation];
    if (v88)
    {
      [v3 setObject:v88 forKeyedSubscript:@"performContactQueryCommand"];
    }
    else
    {
      v89 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v89 forKeyedSubscript:@"performContactQueryCommand"];
    }
  }
  if (self->_performEntityQueryCommand)
  {
    uint64_t v90 = [(_SFPBCommand *)self performEntityQueryCommand];
    v91 = [v90 dictionaryRepresentation];
    if (v91)
    {
      [v3 setObject:v91 forKeyedSubscript:@"performEntityQueryCommand"];
    }
    else
    {
      uint64_t v92 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v92 forKeyedSubscript:@"performEntityQueryCommand"];
    }
  }
  if (self->_performIntentCommand)
  {
    v93 = [(_SFPBCommand *)self performIntentCommand];
    uint64_t v94 = [v93 dictionaryRepresentation];
    if (v94)
    {
      [v3 setObject:v94 forKeyedSubscript:@"performIntentCommand"];
    }
    else
    {
      v95 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v95 forKeyedSubscript:@"performIntentCommand"];
    }
  }
  if (self->_performPersonEntityQueryCommand)
  {
    uint64_t v96 = [(_SFPBCommand *)self performPersonEntityQueryCommand];
    v97 = [v96 dictionaryRepresentation];
    if (v97)
    {
      [v3 setObject:v97 forKeyedSubscript:@"performPersonEntityQueryCommand"];
    }
    else
    {
      uint64_t v98 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v98 forKeyedSubscript:@"performPersonEntityQueryCommand"];
    }
  }
  if (self->_playMediaCommand)
  {
    v99 = [(_SFPBCommand *)self playMediaCommand];
    uint64_t v100 = [v99 dictionaryRepresentation];
    if (v100)
    {
      [v3 setObject:v100 forKeyedSubscript:@"playMediaCommand"];
    }
    else
    {
      v101 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v101 forKeyedSubscript:@"playMediaCommand"];
    }
  }
  if (self->_playVideoCommand)
  {
    v102 = [(_SFPBCommand *)self playVideoCommand];
    v103 = [v102 dictionaryRepresentation];
    if (v103)
    {
      [v3 setObject:v103 forKeyedSubscript:@"playVideoCommand"];
    }
    else
    {
      v104 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v104 forKeyedSubscript:@"playVideoCommand"];
    }
  }
  if (self->_rejectPeopleInPhotoCommand)
  {
    v105 = [(_SFPBCommand *)self rejectPeopleInPhotoCommand];
    v106 = [v105 dictionaryRepresentation];
    if (v106)
    {
      [v3 setObject:v106 forKeyedSubscript:@"rejectPeopleInPhotoCommand"];
    }
    else
    {
      v107 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v107 forKeyedSubscript:@"rejectPeopleInPhotoCommand"];
    }
  }
  if (self->_requestAppClipInstallCommand)
  {
    v108 = [(_SFPBCommand *)self requestAppClipInstallCommand];
    v109 = [v108 dictionaryRepresentation];
    if (v109)
    {
      [v3 setObject:v109 forKeyedSubscript:@"requestAppClipInstallCommand"];
    }
    else
    {
      v110 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v110 forKeyedSubscript:@"requestAppClipInstallCommand"];
    }
  }
  if (self->_requestProductPageCommand)
  {
    v111 = [(_SFPBCommand *)self requestProductPageCommand];
    v112 = [v111 dictionaryRepresentation];
    if (v112)
    {
      [v3 setObject:v112 forKeyedSubscript:@"requestProductPageCommand"];
    }
    else
    {
      v113 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v113 forKeyedSubscript:@"requestProductPageCommand"];
    }
  }
  if (self->_requestUserReportCommand)
  {
    v114 = [(_SFPBCommand *)self requestUserReportCommand];
    v115 = [v114 dictionaryRepresentation];
    if (v115)
    {
      [v3 setObject:v115 forKeyedSubscript:@"requestUserReportCommand"];
    }
    else
    {
      v116 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v116 forKeyedSubscript:@"requestUserReportCommand"];
    }
  }
  if (self->_runVoiceShortcutCommand)
  {
    v117 = [(_SFPBCommand *)self runVoiceShortcutCommand];
    v118 = [v117 dictionaryRepresentation];
    if (v118)
    {
      [v3 setObject:v118 forKeyedSubscript:@"runVoiceShortcutCommand"];
    }
    else
    {
      v119 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v119 forKeyedSubscript:@"runVoiceShortcutCommand"];
    }
  }
  if (self->_searchInAppCommand)
  {
    v120 = [(_SFPBCommand *)self searchInAppCommand];
    v121 = [v120 dictionaryRepresentation];
    if (v121)
    {
      [v3 setObject:v121 forKeyedSubscript:@"searchInAppCommand"];
    }
    else
    {
      v122 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v122 forKeyedSubscript:@"searchInAppCommand"];
    }
  }
  if (self->_searchWebCommand)
  {
    v123 = [(_SFPBCommand *)self searchWebCommand];
    v124 = [v123 dictionaryRepresentation];
    if (v124)
    {
      [v3 setObject:v124 forKeyedSubscript:@"searchWebCommand"];
    }
    else
    {
      v125 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v125 forKeyedSubscript:@"searchWebCommand"];
    }
  }
  if (self->_shareCommand)
  {
    v126 = [(_SFPBCommand *)self shareCommand];
    v127 = [v126 dictionaryRepresentation];
    if (v127)
    {
      [v3 setObject:v127 forKeyedSubscript:@"shareCommand"];
    }
    else
    {
      v128 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v128 forKeyedSubscript:@"shareCommand"];
    }
  }
  if (self->_showAppStoreSheetCommand)
  {
    v129 = [(_SFPBCommand *)self showAppStoreSheetCommand];
    v130 = [v129 dictionaryRepresentation];
    if (v130)
    {
      [v3 setObject:v130 forKeyedSubscript:@"showAppStoreSheetCommand"];
    }
    else
    {
      v131 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v131 forKeyedSubscript:@"showAppStoreSheetCommand"];
    }
  }
  if (self->_showContactCardCommand)
  {
    v132 = [(_SFPBCommand *)self showContactCardCommand];
    v133 = [v132 dictionaryRepresentation];
    if (v133)
    {
      [v3 setObject:v133 forKeyedSubscript:@"showContactCardCommand"];
    }
    else
    {
      v134 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v134 forKeyedSubscript:@"showContactCardCommand"];
    }
  }
  if (self->_showPhotosOneUpViewCommand)
  {
    v135 = [(_SFPBCommand *)self showPhotosOneUpViewCommand];
    v136 = [v135 dictionaryRepresentation];
    if (v136)
    {
      [v3 setObject:v136 forKeyedSubscript:@"showPhotosOneUpViewCommand"];
    }
    else
    {
      v137 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v137 forKeyedSubscript:@"showPhotosOneUpViewCommand"];
    }
  }
  if (self->_showPurchaseRequestSheetCommand)
  {
    v138 = [(_SFPBCommand *)self showPurchaseRequestSheetCommand];
    v139 = [v138 dictionaryRepresentation];
    if (v139)
    {
      [v3 setObject:v139 forKeyedSubscript:@"showPurchaseRequestSheetCommand"];
    }
    else
    {
      v140 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v140 forKeyedSubscript:@"showPurchaseRequestSheetCommand"];
    }
  }
  if (self->_showSFCardCommand)
  {
    v141 = [(_SFPBCommand *)self showSFCardCommand];
    v142 = [v141 dictionaryRepresentation];
    if (v142)
    {
      [v3 setObject:v142 forKeyedSubscript:@"showSFCardCommand"];
    }
    else
    {
      v143 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v143 forKeyedSubscript:@"showSFCardCommand"];
    }
  }
  if (self->_showScreenTimeRequestSheetCommand)
  {
    v144 = [(_SFPBCommand *)self showScreenTimeRequestSheetCommand];
    v145 = [v144 dictionaryRepresentation];
    if (v145)
    {
      [v3 setObject:v145 forKeyedSubscript:@"showScreenTimeRequestSheetCommand"];
    }
    else
    {
      v146 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v146 forKeyedSubscript:@"showScreenTimeRequestSheetCommand"];
    }
  }
  if (self->_showWrapperResponseViewCommand)
  {
    v147 = [(_SFPBCommand *)self showWrapperResponseViewCommand];
    v148 = [v147 dictionaryRepresentation];
    if (v148)
    {
      [v3 setObject:v148 forKeyedSubscript:@"showWrapperResponseViewCommand"];
    }
    else
    {
      v149 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v149 forKeyedSubscript:@"showWrapperResponseViewCommand"];
    }
  }
  if (self->_subscribeForUpdatesCommand)
  {
    v150 = [(_SFPBCommand *)self subscribeForUpdatesCommand];
    v151 = [v150 dictionaryRepresentation];
    if (v151)
    {
      [v3 setObject:v151 forKeyedSubscript:@"subscribeForUpdatesCommand"];
    }
    else
    {
      v152 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v152 forKeyedSubscript:@"subscribeForUpdatesCommand"];
    }
  }
  if (self->_toggleAudioCommand)
  {
    v153 = [(_SFPBCommand *)self toggleAudioCommand];
    v154 = [v153 dictionaryRepresentation];
    if (v154)
    {
      [v3 setObject:v154 forKeyedSubscript:@"toggleAudioCommand"];
    }
    else
    {
      v155 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v155 forKeyedSubscript:@"toggleAudioCommand"];
    }
  }
  if (self->_toggleWatchListStatusCommand)
  {
    v156 = [(_SFPBCommand *)self toggleWatchListStatusCommand];
    v157 = [v156 dictionaryRepresentation];
    if (v157)
    {
      [v3 setObject:v157 forKeyedSubscript:@"toggleWatchListStatusCommand"];
    }
    else
    {
      v158 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v158 forKeyedSubscript:@"toggleWatchListStatusCommand"];
    }
  }
  if (self->_updateSearchQueryCommand)
  {
    v159 = [(_SFPBCommand *)self updateSearchQueryCommand];
    v160 = [v159 dictionaryRepresentation];
    if (v160)
    {
      [v3 setObject:v160 forKeyedSubscript:@"updateSearchQueryCommand"];
    }
    else
    {
      v161 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v161 forKeyedSubscript:@"updateSearchQueryCommand"];
    }
  }
  if (self->_updateSportsFollowingStatusCommand)
  {
    v162 = [(_SFPBCommand *)self updateSportsFollowingStatusCommand];
    v163 = [v162 dictionaryRepresentation];
    if (v163)
    {
      [v3 setObject:v163 forKeyedSubscript:@"updateSportsFollowingStatusCommand"];
    }
    else
    {
      v164 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v164 forKeyedSubscript:@"updateSportsFollowingStatusCommand"];
    }
  }
  if (self->_viewEmailCommand)
  {
    v165 = [(_SFPBCommand *)self viewEmailCommand];
    objc_super v166 = [v165 dictionaryRepresentation];
    if (v166)
    {
      [v3 setObject:v166 forKeyedSubscript:@"viewEmailCommand"];
    }
    else
    {
      v167 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v167 forKeyedSubscript:@"viewEmailCommand"];
    }
  }
  id v168 = v3;

  return v168;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBShowContactCardCommand *)self->_showContactCardCommand hash];
  unint64_t v4 = [(_SFPBShowSFCardCommand *)self->_showSFCardCommand hash] ^ v3;
  unint64_t v5 = [(_SFPBShowAppStoreSheetCommand *)self->_showAppStoreSheetCommand hash];
  unint64_t v6 = v4 ^ v5 ^ [(_SFPBOpenPunchoutCommand *)self->_openPunchoutCommand hash];
  unint64_t v7 = [(_SFPBOpenFileProviderItemCommand *)self->_openFileProviderItemCommand hash];
  unint64_t v8 = v7 ^ [(_SFPBOpenAppClipCommand *)self->_openAppClipCommand hash];
  unint64_t v9 = v6 ^ v8 ^ [(_SFPBOpenWebClipCommand *)self->_openWebClipCommand hash];
  unint64_t v10 = [(_SFPBRequestAppClipInstallCommand *)self->_requestAppClipInstallCommand hash];
  unint64_t v11 = v10 ^ [(_SFPBRequestUserReportCommand *)self->_requestUserReportCommand hash];
  unint64_t v12 = v11 ^ [(_SFPBLaunchAppCommand *)self->_launchAppCommand hash];
  unint64_t v13 = v9 ^ v12 ^ [(_SFPBRunVoiceShortcutCommand *)self->_runVoiceShortcutCommand hash];
  unint64_t v14 = [(_SFPBIndexedUserActivityCommand *)self->_indexedUserActivityCommand hash];
  unint64_t v15 = v14 ^ [(_SFPBOpenCoreSpotlightItemCommand *)self->_openCoreSpotlightItemCommand hash];
  unint64_t v16 = v15 ^ [(_SFPBPerformIntentCommand *)self->_performIntentCommand hash];
  unint64_t v17 = v16 ^ [(_SFPBSearchInAppCommand *)self->_searchInAppCommand hash];
  unint64_t v18 = v13 ^ v17 ^ [(_SFPBUpdateSearchQueryCommand *)self->_updateSearchQueryCommand hash];
  unint64_t v19 = [(_SFPBSearchWebCommand *)self->_searchWebCommand hash];
  unint64_t v20 = v19 ^ [(_SFPBInvokeSiriCommand *)self->_invokeSiriCommand hash];
  unint64_t v21 = v20 ^ [(_SFPBPerformContactQueryCommand *)self->_performContactQueryCommand hash];
  unint64_t v22 = v21 ^ [(_SFPBOpenCalculationCommand *)self->_openCalculationCommand hash];
  unint64_t v23 = v22 ^ [(_SFPBPlayVideoCommand *)self->_playVideoCommand hash];
  unint64_t v24 = v18 ^ v23 ^ [(_SFPBCallCommand *)self->_callCommand hash];
  unint64_t v25 = [(_SFPBEmailCommand *)self->_emailCommand hash];
  unint64_t v26 = v25 ^ [(_SFPBBeginMapsRoutingCommand *)self->_beginMapsRoutingCommand hash];
  unint64_t v27 = v26 ^ [(_SFPBToggleAudioCommand *)self->_toggleAudioCommand hash];
  unint64_t v28 = v27 ^ [(_SFPBPerformPersonEntityQueryCommand *)self->_performPersonEntityQueryCommand hash];
  unint64_t v29 = v28 ^ [(_SFPBShowPurchaseRequestSheetCommand *)self->_showPurchaseRequestSheetCommand hash];
  unint64_t v30 = v29 ^ [(_SFPBShowScreenTimeRequestSheetCommand *)self->_showScreenTimeRequestSheetCommand hash];
  unint64_t v31 = v24 ^ v30 ^ [(_SFPBPerformEntityQueryCommand *)self->_performEntityQueryCommand hash];
  unint64_t v32 = [(_SFPBShareCommand *)self->_shareCommand hash];
  unint64_t v33 = v32 ^ [(_SFPBCopyCommand *)self->_copyCommand hash];
  unint64_t v34 = v33 ^ [(_SFPBToggleWatchListStatusCommand *)self->_toggleWatchListStatusCommand hash];
  unint64_t v35 = v34 ^ [(_SFPBShowPhotosOneUpViewCommand *)self->_showPhotosOneUpViewCommand hash];
  unint64_t v36 = v35 ^ [(_SFPBPlayMediaCommand *)self->_playMediaCommand hash];
  unint64_t v37 = v36 ^ [(_SFPBOpenMediaCommand *)self->_openMediaCommand hash];
  unint64_t v38 = v37 ^ [(_SFPBAddToPhotosLibraryCommand *)self->_addToPhotosLibraryCommand hash];
  unint64_t v39 = v31 ^ v38 ^ [(_SFPBPerformContactActionCommand *)self->_performContactActionCommand hash];
  unint64_t v40 = [(_SFPBExpandInlineCommand *)self->_expandInlineCommand hash];
  unint64_t v41 = v40 ^ [(_SFPBSubscribeForUpdatesCommand *)self->_subscribeForUpdatesCommand hash];
  unint64_t v42 = v41 ^ [(_SFPBViewEmailCommand *)self->_viewEmailCommand hash];
  unint64_t v43 = v42 ^ [(_SFPBRejectPeopleInPhotoCommand *)self->_rejectPeopleInPhotoCommand hash];
  unint64_t v44 = v43 ^ [(_SFPBShowWrapperResponseViewCommand *)self->_showWrapperResponseViewCommand hash];
  unint64_t v45 = v44 ^ [(_SFPBClearProactiveCategoryCommand *)self->_clearProactiveCategoryCommand hash];
  unint64_t v46 = v45 ^ [(_SFPBCreateContactCommand *)self->_createContactCommand hash];
  unint64_t v47 = v46 ^ [(_SFPBCreateCalendarEventCommand *)self->_createCalendarEventCommand hash];
  unint64_t v48 = v39 ^ v47 ^ [(_SFPBCreateReminderCommand *)self->_createReminderCommand hash];
  unint64_t v49 = [(_SFPBManageReservationCommand *)self->_manageReservationCommand hash];
  unint64_t v50 = v49 ^ [(_SFPBUpdateSportsFollowingStatusCommand *)self->_updateSportsFollowingStatusCommand hash];
  unint64_t v51 = v50 ^ [(_SFPBRequestProductPageCommand *)self->_requestProductPageCommand hash];
  unint64_t v52 = v51 ^ [(_SFPBFlightCheckinCommand *)self->_flightCheckinCommand hash];
  unint64_t v53 = v52 ^ [(_SFPBExecuteToolCommand *)self->_executeToolCommand hash];
  NSUInteger v54 = v53 ^ [(NSString *)self->_commandDetail hash];
  unint64_t v55 = v54 ^ [(_SFPBTopic *)self->_normalizedTopic hash];
  uint64_t v56 = v55 ^ [(NSData *)self->_backendData hash];
  return v48 ^ v56 ^ [(_SFPBCommandReference *)self->_commandReference hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_277;
  }
  unint64_t v5 = [(_SFPBCommand *)self showContactCardCommand];
  unint64_t v6 = [v4 showContactCardCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v7 = [(_SFPBCommand *)self showContactCardCommand];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBCommand *)self showContactCardCommand];
    unint64_t v10 = [v4 showContactCardCommand];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self showSFCardCommand];
  unint64_t v6 = [v4 showSFCardCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v12 = [(_SFPBCommand *)self showSFCardCommand];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBCommand *)self showSFCardCommand];
    unint64_t v15 = [v4 showSFCardCommand];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self showAppStoreSheetCommand];
  unint64_t v6 = [v4 showAppStoreSheetCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v17 = [(_SFPBCommand *)self showAppStoreSheetCommand];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    unint64_t v19 = [(_SFPBCommand *)self showAppStoreSheetCommand];
    unint64_t v20 = [v4 showAppStoreSheetCommand];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self openPunchoutCommand];
  unint64_t v6 = [v4 openPunchoutCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v22 = [(_SFPBCommand *)self openPunchoutCommand];
  if (v22)
  {
    unint64_t v23 = (void *)v22;
    unint64_t v24 = [(_SFPBCommand *)self openPunchoutCommand];
    unint64_t v25 = [v4 openPunchoutCommand];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self openFileProviderItemCommand];
  unint64_t v6 = [v4 openFileProviderItemCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v27 = [(_SFPBCommand *)self openFileProviderItemCommand];
  if (v27)
  {
    unint64_t v28 = (void *)v27;
    unint64_t v29 = [(_SFPBCommand *)self openFileProviderItemCommand];
    unint64_t v30 = [v4 openFileProviderItemCommand];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self openAppClipCommand];
  unint64_t v6 = [v4 openAppClipCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v32 = [(_SFPBCommand *)self openAppClipCommand];
  if (v32)
  {
    unint64_t v33 = (void *)v32;
    unint64_t v34 = [(_SFPBCommand *)self openAppClipCommand];
    unint64_t v35 = [v4 openAppClipCommand];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self openWebClipCommand];
  unint64_t v6 = [v4 openWebClipCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v37 = [(_SFPBCommand *)self openWebClipCommand];
  if (v37)
  {
    unint64_t v38 = (void *)v37;
    unint64_t v39 = [(_SFPBCommand *)self openWebClipCommand];
    unint64_t v40 = [v4 openWebClipCommand];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self requestAppClipInstallCommand];
  unint64_t v6 = [v4 requestAppClipInstallCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v42 = [(_SFPBCommand *)self requestAppClipInstallCommand];
  if (v42)
  {
    unint64_t v43 = (void *)v42;
    unint64_t v44 = [(_SFPBCommand *)self requestAppClipInstallCommand];
    unint64_t v45 = [v4 requestAppClipInstallCommand];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self requestUserReportCommand];
  unint64_t v6 = [v4 requestUserReportCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v47 = [(_SFPBCommand *)self requestUserReportCommand];
  if (v47)
  {
    unint64_t v48 = (void *)v47;
    unint64_t v49 = [(_SFPBCommand *)self requestUserReportCommand];
    unint64_t v50 = [v4 requestUserReportCommand];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self launchAppCommand];
  unint64_t v6 = [v4 launchAppCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v52 = [(_SFPBCommand *)self launchAppCommand];
  if (v52)
  {
    unint64_t v53 = (void *)v52;
    NSUInteger v54 = [(_SFPBCommand *)self launchAppCommand];
    unint64_t v55 = [v4 launchAppCommand];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self runVoiceShortcutCommand];
  unint64_t v6 = [v4 runVoiceShortcutCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v57 = [(_SFPBCommand *)self runVoiceShortcutCommand];
  if (v57)
  {
    uint64_t v58 = (void *)v57;
    v59 = [(_SFPBCommand *)self runVoiceShortcutCommand];
    uint64_t v60 = [v4 runVoiceShortcutCommand];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self indexedUserActivityCommand];
  unint64_t v6 = [v4 indexedUserActivityCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v62 = [(_SFPBCommand *)self indexedUserActivityCommand];
  if (v62)
  {
    v63 = (void *)v62;
    uint64_t v64 = [(_SFPBCommand *)self indexedUserActivityCommand];
    v65 = [v4 indexedUserActivityCommand];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self openCoreSpotlightItemCommand];
  unint64_t v6 = [v4 openCoreSpotlightItemCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v67 = [(_SFPBCommand *)self openCoreSpotlightItemCommand];
  if (v67)
  {
    uint64_t v68 = (void *)v67;
    v69 = [(_SFPBCommand *)self openCoreSpotlightItemCommand];
    uint64_t v70 = [v4 openCoreSpotlightItemCommand];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self performIntentCommand];
  unint64_t v6 = [v4 performIntentCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v72 = [(_SFPBCommand *)self performIntentCommand];
  if (v72)
  {
    v73 = (void *)v72;
    uint64_t v74 = [(_SFPBCommand *)self performIntentCommand];
    v75 = [v4 performIntentCommand];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self searchInAppCommand];
  unint64_t v6 = [v4 searchInAppCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v77 = [(_SFPBCommand *)self searchInAppCommand];
  if (v77)
  {
    uint64_t v78 = (void *)v77;
    v79 = [(_SFPBCommand *)self searchInAppCommand];
    uint64_t v80 = [v4 searchInAppCommand];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self updateSearchQueryCommand];
  unint64_t v6 = [v4 updateSearchQueryCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v82 = [(_SFPBCommand *)self updateSearchQueryCommand];
  if (v82)
  {
    v83 = (void *)v82;
    uint64_t v84 = [(_SFPBCommand *)self updateSearchQueryCommand];
    v85 = [v4 updateSearchQueryCommand];
    int v86 = [v84 isEqual:v85];

    if (!v86) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self searchWebCommand];
  unint64_t v6 = [v4 searchWebCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v87 = [(_SFPBCommand *)self searchWebCommand];
  if (v87)
  {
    uint64_t v88 = (void *)v87;
    v89 = [(_SFPBCommand *)self searchWebCommand];
    uint64_t v90 = [v4 searchWebCommand];
    int v91 = [v89 isEqual:v90];

    if (!v91) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self invokeSiriCommand];
  unint64_t v6 = [v4 invokeSiriCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v92 = [(_SFPBCommand *)self invokeSiriCommand];
  if (v92)
  {
    v93 = (void *)v92;
    uint64_t v94 = [(_SFPBCommand *)self invokeSiriCommand];
    v95 = [v4 invokeSiriCommand];
    int v96 = [v94 isEqual:v95];

    if (!v96) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self performContactQueryCommand];
  unint64_t v6 = [v4 performContactQueryCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v97 = [(_SFPBCommand *)self performContactQueryCommand];
  if (v97)
  {
    uint64_t v98 = (void *)v97;
    v99 = [(_SFPBCommand *)self performContactQueryCommand];
    uint64_t v100 = [v4 performContactQueryCommand];
    int v101 = [v99 isEqual:v100];

    if (!v101) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self openCalculationCommand];
  unint64_t v6 = [v4 openCalculationCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v102 = [(_SFPBCommand *)self openCalculationCommand];
  if (v102)
  {
    v103 = (void *)v102;
    v104 = [(_SFPBCommand *)self openCalculationCommand];
    v105 = [v4 openCalculationCommand];
    int v106 = [v104 isEqual:v105];

    if (!v106) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self playVideoCommand];
  unint64_t v6 = [v4 playVideoCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v107 = [(_SFPBCommand *)self playVideoCommand];
  if (v107)
  {
    v108 = (void *)v107;
    v109 = [(_SFPBCommand *)self playVideoCommand];
    v110 = [v4 playVideoCommand];
    int v111 = [v109 isEqual:v110];

    if (!v111) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self callCommand];
  unint64_t v6 = [v4 callCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v112 = [(_SFPBCommand *)self callCommand];
  if (v112)
  {
    v113 = (void *)v112;
    v114 = [(_SFPBCommand *)self callCommand];
    v115 = [v4 callCommand];
    int v116 = [v114 isEqual:v115];

    if (!v116) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self emailCommand];
  unint64_t v6 = [v4 emailCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v117 = [(_SFPBCommand *)self emailCommand];
  if (v117)
  {
    v118 = (void *)v117;
    v119 = [(_SFPBCommand *)self emailCommand];
    v120 = [v4 emailCommand];
    int v121 = [v119 isEqual:v120];

    if (!v121) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self beginMapsRoutingCommand];
  unint64_t v6 = [v4 beginMapsRoutingCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v122 = [(_SFPBCommand *)self beginMapsRoutingCommand];
  if (v122)
  {
    v123 = (void *)v122;
    v124 = [(_SFPBCommand *)self beginMapsRoutingCommand];
    v125 = [v4 beginMapsRoutingCommand];
    int v126 = [v124 isEqual:v125];

    if (!v126) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self toggleAudioCommand];
  unint64_t v6 = [v4 toggleAudioCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v127 = [(_SFPBCommand *)self toggleAudioCommand];
  if (v127)
  {
    v128 = (void *)v127;
    v129 = [(_SFPBCommand *)self toggleAudioCommand];
    v130 = [v4 toggleAudioCommand];
    int v131 = [v129 isEqual:v130];

    if (!v131) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self performPersonEntityQueryCommand];
  unint64_t v6 = [v4 performPersonEntityQueryCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v132 = [(_SFPBCommand *)self performPersonEntityQueryCommand];
  if (v132)
  {
    v133 = (void *)v132;
    v134 = [(_SFPBCommand *)self performPersonEntityQueryCommand];
    v135 = [v4 performPersonEntityQueryCommand];
    int v136 = [v134 isEqual:v135];

    if (!v136) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self showPurchaseRequestSheetCommand];
  unint64_t v6 = [v4 showPurchaseRequestSheetCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v137 = [(_SFPBCommand *)self showPurchaseRequestSheetCommand];
  if (v137)
  {
    v138 = (void *)v137;
    v139 = [(_SFPBCommand *)self showPurchaseRequestSheetCommand];
    v140 = [v4 showPurchaseRequestSheetCommand];
    int v141 = [v139 isEqual:v140];

    if (!v141) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self showScreenTimeRequestSheetCommand];
  unint64_t v6 = [v4 showScreenTimeRequestSheetCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v142 = [(_SFPBCommand *)self showScreenTimeRequestSheetCommand];
  if (v142)
  {
    v143 = (void *)v142;
    v144 = [(_SFPBCommand *)self showScreenTimeRequestSheetCommand];
    v145 = [v4 showScreenTimeRequestSheetCommand];
    int v146 = [v144 isEqual:v145];

    if (!v146) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self performEntityQueryCommand];
  unint64_t v6 = [v4 performEntityQueryCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v147 = [(_SFPBCommand *)self performEntityQueryCommand];
  if (v147)
  {
    v148 = (void *)v147;
    v149 = [(_SFPBCommand *)self performEntityQueryCommand];
    v150 = [v4 performEntityQueryCommand];
    int v151 = [v149 isEqual:v150];

    if (!v151) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self shareCommand];
  unint64_t v6 = [v4 shareCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v152 = [(_SFPBCommand *)self shareCommand];
  if (v152)
  {
    v153 = (void *)v152;
    v154 = [(_SFPBCommand *)self shareCommand];
    v155 = [v4 shareCommand];
    int v156 = [v154 isEqual:v155];

    if (!v156) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self copyCommand];
  unint64_t v6 = (void *)[v4 copyCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  v157 = [(_SFPBCommand *)self copyCommand];
  if (v157)
  {
    v158 = v157;
    v159 = [(_SFPBCommand *)self copyCommand];
    v160 = (void *)[v4 copyCommand];
    BOOL v161 = [(_SFPBCopyCommand *)v159 isEqual:v160];

    if (!v161) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self toggleWatchListStatusCommand];
  unint64_t v6 = [v4 toggleWatchListStatusCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v162 = [(_SFPBCommand *)self toggleWatchListStatusCommand];
  if (v162)
  {
    v163 = (void *)v162;
    v164 = [(_SFPBCommand *)self toggleWatchListStatusCommand];
    v165 = [v4 toggleWatchListStatusCommand];
    int v166 = [v164 isEqual:v165];

    if (!v166) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self showPhotosOneUpViewCommand];
  unint64_t v6 = [v4 showPhotosOneUpViewCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v167 = [(_SFPBCommand *)self showPhotosOneUpViewCommand];
  if (v167)
  {
    id v168 = (void *)v167;
    v169 = [(_SFPBCommand *)self showPhotosOneUpViewCommand];
    v170 = [v4 showPhotosOneUpViewCommand];
    int v171 = [v169 isEqual:v170];

    if (!v171) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self playMediaCommand];
  unint64_t v6 = [v4 playMediaCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v172 = [(_SFPBCommand *)self playMediaCommand];
  if (v172)
  {
    v173 = (void *)v172;
    v174 = [(_SFPBCommand *)self playMediaCommand];
    v175 = [v4 playMediaCommand];
    int v176 = [v174 isEqual:v175];

    if (!v176) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self openMediaCommand];
  unint64_t v6 = [v4 openMediaCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v177 = [(_SFPBCommand *)self openMediaCommand];
  if (v177)
  {
    v178 = (void *)v177;
    v179 = [(_SFPBCommand *)self openMediaCommand];
    v180 = [v4 openMediaCommand];
    int v181 = [v179 isEqual:v180];

    if (!v181) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self addToPhotosLibraryCommand];
  unint64_t v6 = [v4 addToPhotosLibraryCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v182 = [(_SFPBCommand *)self addToPhotosLibraryCommand];
  if (v182)
  {
    v183 = (void *)v182;
    v184 = [(_SFPBCommand *)self addToPhotosLibraryCommand];
    v185 = [v4 addToPhotosLibraryCommand];
    int v186 = [v184 isEqual:v185];

    if (!v186) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self performContactActionCommand];
  unint64_t v6 = [v4 performContactActionCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v187 = [(_SFPBCommand *)self performContactActionCommand];
  if (v187)
  {
    v188 = (void *)v187;
    v189 = [(_SFPBCommand *)self performContactActionCommand];
    v190 = [v4 performContactActionCommand];
    int v191 = [v189 isEqual:v190];

    if (!v191) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self expandInlineCommand];
  unint64_t v6 = [v4 expandInlineCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v192 = [(_SFPBCommand *)self expandInlineCommand];
  if (v192)
  {
    v193 = (void *)v192;
    v194 = [(_SFPBCommand *)self expandInlineCommand];
    v195 = [v4 expandInlineCommand];
    int v196 = [v194 isEqual:v195];

    if (!v196) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self subscribeForUpdatesCommand];
  unint64_t v6 = [v4 subscribeForUpdatesCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v197 = [(_SFPBCommand *)self subscribeForUpdatesCommand];
  if (v197)
  {
    v198 = (void *)v197;
    v199 = [(_SFPBCommand *)self subscribeForUpdatesCommand];
    v200 = [v4 subscribeForUpdatesCommand];
    int v201 = [v199 isEqual:v200];

    if (!v201) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self viewEmailCommand];
  unint64_t v6 = [v4 viewEmailCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v202 = [(_SFPBCommand *)self viewEmailCommand];
  if (v202)
  {
    v203 = (void *)v202;
    v204 = [(_SFPBCommand *)self viewEmailCommand];
    v205 = [v4 viewEmailCommand];
    int v206 = [v204 isEqual:v205];

    if (!v206) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self rejectPeopleInPhotoCommand];
  unint64_t v6 = [v4 rejectPeopleInPhotoCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v207 = [(_SFPBCommand *)self rejectPeopleInPhotoCommand];
  if (v207)
  {
    v208 = (void *)v207;
    v209 = [(_SFPBCommand *)self rejectPeopleInPhotoCommand];
    v210 = [v4 rejectPeopleInPhotoCommand];
    int v211 = [v209 isEqual:v210];

    if (!v211) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self showWrapperResponseViewCommand];
  unint64_t v6 = [v4 showWrapperResponseViewCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v212 = [(_SFPBCommand *)self showWrapperResponseViewCommand];
  if (v212)
  {
    v213 = (void *)v212;
    v214 = [(_SFPBCommand *)self showWrapperResponseViewCommand];
    v215 = [v4 showWrapperResponseViewCommand];
    int v216 = [v214 isEqual:v215];

    if (!v216) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self clearProactiveCategoryCommand];
  unint64_t v6 = [v4 clearProactiveCategoryCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v217 = [(_SFPBCommand *)self clearProactiveCategoryCommand];
  if (v217)
  {
    v218 = (void *)v217;
    v219 = [(_SFPBCommand *)self clearProactiveCategoryCommand];
    v220 = [v4 clearProactiveCategoryCommand];
    int v221 = [v219 isEqual:v220];

    if (!v221) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self createContactCommand];
  unint64_t v6 = [v4 createContactCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v222 = [(_SFPBCommand *)self createContactCommand];
  if (v222)
  {
    v223 = (void *)v222;
    v224 = [(_SFPBCommand *)self createContactCommand];
    v225 = [v4 createContactCommand];
    int v226 = [v224 isEqual:v225];

    if (!v226) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self createCalendarEventCommand];
  unint64_t v6 = [v4 createCalendarEventCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v227 = [(_SFPBCommand *)self createCalendarEventCommand];
  if (v227)
  {
    v228 = (void *)v227;
    v229 = [(_SFPBCommand *)self createCalendarEventCommand];
    v230 = [v4 createCalendarEventCommand];
    int v231 = [v229 isEqual:v230];

    if (!v231) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self createReminderCommand];
  unint64_t v6 = [v4 createReminderCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v232 = [(_SFPBCommand *)self createReminderCommand];
  if (v232)
  {
    v233 = (void *)v232;
    v234 = [(_SFPBCommand *)self createReminderCommand];
    v235 = [v4 createReminderCommand];
    int v236 = [v234 isEqual:v235];

    if (!v236) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self manageReservationCommand];
  unint64_t v6 = [v4 manageReservationCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v237 = [(_SFPBCommand *)self manageReservationCommand];
  if (v237)
  {
    v238 = (void *)v237;
    v239 = [(_SFPBCommand *)self manageReservationCommand];
    v240 = [v4 manageReservationCommand];
    int v241 = [v239 isEqual:v240];

    if (!v241) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self updateSportsFollowingStatusCommand];
  unint64_t v6 = [v4 updateSportsFollowingStatusCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v242 = [(_SFPBCommand *)self updateSportsFollowingStatusCommand];
  if (v242)
  {
    v243 = (void *)v242;
    v244 = [(_SFPBCommand *)self updateSportsFollowingStatusCommand];
    v245 = [v4 updateSportsFollowingStatusCommand];
    int v246 = [v244 isEqual:v245];

    if (!v246) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self requestProductPageCommand];
  unint64_t v6 = [v4 requestProductPageCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v247 = [(_SFPBCommand *)self requestProductPageCommand];
  if (v247)
  {
    v248 = (void *)v247;
    v249 = [(_SFPBCommand *)self requestProductPageCommand];
    v250 = [v4 requestProductPageCommand];
    int v251 = [v249 isEqual:v250];

    if (!v251) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self flightCheckinCommand];
  unint64_t v6 = [v4 flightCheckinCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v252 = [(_SFPBCommand *)self flightCheckinCommand];
  if (v252)
  {
    v253 = (void *)v252;
    v254 = [(_SFPBCommand *)self flightCheckinCommand];
    v255 = [v4 flightCheckinCommand];
    int v256 = [v254 isEqual:v255];

    if (!v256) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self executeToolCommand];
  unint64_t v6 = [v4 executeToolCommand];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v257 = [(_SFPBCommand *)self executeToolCommand];
  if (v257)
  {
    v258 = (void *)v257;
    v259 = [(_SFPBCommand *)self executeToolCommand];
    v260 = [v4 executeToolCommand];
    int v261 = [v259 isEqual:v260];

    if (!v261) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self commandDetail];
  unint64_t v6 = [v4 commandDetail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v262 = [(_SFPBCommand *)self commandDetail];
  if (v262)
  {
    v263 = (void *)v262;
    v264 = [(_SFPBCommand *)self commandDetail];
    v265 = [v4 commandDetail];
    int v266 = [v264 isEqual:v265];

    if (!v266) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self normalizedTopic];
  unint64_t v6 = [v4 normalizedTopic];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v267 = [(_SFPBCommand *)self normalizedTopic];
  if (v267)
  {
    v268 = (void *)v267;
    v269 = [(_SFPBCommand *)self normalizedTopic];
    v270 = [v4 normalizedTopic];
    int v271 = [v269 isEqual:v270];

    if (!v271) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self backendData];
  unint64_t v6 = [v4 backendData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_276;
  }
  uint64_t v272 = [(_SFPBCommand *)self backendData];
  if (v272)
  {
    v273 = (void *)v272;
    v274 = [(_SFPBCommand *)self backendData];
    v275 = [v4 backendData];
    int v276 = [v274 isEqual:v275];

    if (!v276) {
      goto LABEL_277;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommand *)self commandReference];
  unint64_t v6 = [v4 commandReference];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v277 = [(_SFPBCommand *)self commandReference];
    if (!v277)
    {

LABEL_280:
      BOOL v282 = 1;
      goto LABEL_278;
    }
    v278 = (void *)v277;
    v279 = [(_SFPBCommand *)self commandReference];
    v280 = [v4 commandReference];
    char v281 = [v279 isEqual:v280];

    if (v281) {
      goto LABEL_280;
    }
  }
  else
  {
LABEL_276:
  }
LABEL_277:
  BOOL v282 = 0;
LABEL_278:

  return v282;
}

- (void)writeTo:(id)a3
{
  id v59 = a3;
  id v4 = [(_SFPBCommand *)self showContactCardCommand];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBCommand *)self showSFCardCommand];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBCommand *)self showAppStoreSheetCommand];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBCommand *)self openPunchoutCommand];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v8 = [(_SFPBCommand *)self openFileProviderItemCommand];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v9 = [(_SFPBCommand *)self openAppClipCommand];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v10 = [(_SFPBCommand *)self openWebClipCommand];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }

  int v11 = [(_SFPBCommand *)self requestAppClipInstallCommand];
  if (v11) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v12 = [(_SFPBCommand *)self requestUserReportCommand];
  if (v12) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v13 = [(_SFPBCommand *)self launchAppCommand];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBCommand *)self runVoiceShortcutCommand];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v15 = [(_SFPBCommand *)self indexedUserActivityCommand];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBCommand *)self openCoreSpotlightItemCommand];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBCommand *)self performIntentCommand];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v18 = [(_SFPBCommand *)self searchInAppCommand];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v19 = [(_SFPBCommand *)self updateSearchQueryCommand];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v20 = [(_SFPBCommand *)self searchWebCommand];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  int v21 = [(_SFPBCommand *)self invokeSiriCommand];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v22 = [(_SFPBCommand *)self performContactQueryCommand];
  if (v22) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v23 = [(_SFPBCommand *)self openCalculationCommand];
  if (v23) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v24 = [(_SFPBCommand *)self playVideoCommand];
  if (v24) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v25 = [(_SFPBCommand *)self callCommand];
  if (v25) {
    PBDataWriterWriteSubmessage();
  }

  int v26 = [(_SFPBCommand *)self emailCommand];
  if (v26) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v27 = [(_SFPBCommand *)self beginMapsRoutingCommand];
  if (v27) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v28 = [(_SFPBCommand *)self toggleAudioCommand];
  if (v28) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v29 = [(_SFPBCommand *)self performPersonEntityQueryCommand];
  if (v29) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v30 = [(_SFPBCommand *)self showPurchaseRequestSheetCommand];
  if (v30) {
    PBDataWriterWriteSubmessage();
  }

  int v31 = [(_SFPBCommand *)self showScreenTimeRequestSheetCommand];
  if (v31) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v32 = [(_SFPBCommand *)self performEntityQueryCommand];
  if (v32) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v33 = [(_SFPBCommand *)self shareCommand];
  if (v33) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v34 = [(_SFPBCommand *)self copyCommand];
  if (v34) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v35 = [(_SFPBCommand *)self toggleWatchListStatusCommand];
  if (v35) {
    PBDataWriterWriteSubmessage();
  }

  int v36 = [(_SFPBCommand *)self showPhotosOneUpViewCommand];
  if (v36) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v37 = [(_SFPBCommand *)self playMediaCommand];
  if (v37) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v38 = [(_SFPBCommand *)self openMediaCommand];
  if (v38) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v39 = [(_SFPBCommand *)self addToPhotosLibraryCommand];
  if (v39) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v40 = [(_SFPBCommand *)self performContactActionCommand];
  if (v40) {
    PBDataWriterWriteSubmessage();
  }

  int v41 = [(_SFPBCommand *)self expandInlineCommand];
  if (v41) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v42 = [(_SFPBCommand *)self subscribeForUpdatesCommand];
  if (v42) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v43 = [(_SFPBCommand *)self viewEmailCommand];
  if (v43) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v44 = [(_SFPBCommand *)self rejectPeopleInPhotoCommand];
  if (v44) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v45 = [(_SFPBCommand *)self showWrapperResponseViewCommand];
  if (v45) {
    PBDataWriterWriteSubmessage();
  }

  int v46 = [(_SFPBCommand *)self clearProactiveCategoryCommand];
  if (v46) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v47 = [(_SFPBCommand *)self createContactCommand];
  if (v47) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v48 = [(_SFPBCommand *)self createCalendarEventCommand];
  if (v48) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v49 = [(_SFPBCommand *)self createReminderCommand];
  if (v49) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v50 = [(_SFPBCommand *)self manageReservationCommand];
  if (v50) {
    PBDataWriterWriteSubmessage();
  }

  int v51 = [(_SFPBCommand *)self updateSportsFollowingStatusCommand];
  if (v51) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v52 = [(_SFPBCommand *)self requestProductPageCommand];
  if (v52) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v53 = [(_SFPBCommand *)self flightCheckinCommand];
  if (v53) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v54 = [(_SFPBCommand *)self executeToolCommand];
  if (v54) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v55 = [(_SFPBCommand *)self commandDetail];
  if (v55) {
    PBDataWriterWriteStringField();
  }

  int v56 = [(_SFPBCommand *)self normalizedTopic];
  if (v56) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v57 = [(_SFPBCommand *)self backendData];
  if (v57) {
    PBDataWriterWriteDataField();
  }

  uint64_t v58 = [(_SFPBCommand *)self commandReference];
  if (v58) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCommandReadFrom(self, (uint64_t)a3);
}

- (void)setCommandReference:(id)a3
{
}

- (void)setBackendData:(id)a3
{
  self->_backendData = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setNormalizedTopic:(id)a3
{
}

- (void)setCommandDetail:(id)a3
{
  self->_commandDetail = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (_SFPBExecuteToolCommand)executeToolCommand
{
  if (self->_whichValue == 51) {
    v2 = self->_executeToolCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setExecuteToolCommand:(id)a3
{
  id v4 = (_SFPBExecuteToolCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  unint64_t v55 = 51;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = v4;
}

- (_SFPBFlightCheckinCommand)flightCheckinCommand
{
  if (self->_whichValue == 50) {
    v2 = self->_flightCheckinCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFlightCheckinCommand:(id)a3
{
  id v4 = (_SFPBFlightCheckinCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 50;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = v4;
}

- (_SFPBRequestProductPageCommand)requestProductPageCommand
{
  if (self->_whichValue == 49) {
    v2 = self->_requestProductPageCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestProductPageCommand:(id)a3
{
  id v4 = (_SFPBRequestProductPageCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 49;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = v4;
}

- (_SFPBUpdateSportsFollowingStatusCommand)updateSportsFollowingStatusCommand
{
  if (self->_whichValue == 48) {
    v2 = self->_updateSportsFollowingStatusCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUpdateSportsFollowingStatusCommand:(id)a3
{
  id v4 = (_SFPBUpdateSportsFollowingStatusCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 48;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = v4;
}

- (_SFPBManageReservationCommand)manageReservationCommand
{
  if (self->_whichValue == 47) {
    v2 = self->_manageReservationCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setManageReservationCommand:(id)a3
{
  id v4 = (_SFPBManageReservationCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 47;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = v4;
}

- (_SFPBCreateReminderCommand)createReminderCommand
{
  if (self->_whichValue == 46) {
    v2 = self->_createReminderCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCreateReminderCommand:(id)a3
{
  id v4 = (_SFPBCreateReminderCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 46;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = v4;
}

- (_SFPBCreateCalendarEventCommand)createCalendarEventCommand
{
  if (self->_whichValue == 45) {
    v2 = self->_createCalendarEventCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCreateCalendarEventCommand:(id)a3
{
  id v4 = (_SFPBCreateCalendarEventCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 45;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = v4;
}

- (_SFPBCreateContactCommand)createContactCommand
{
  if (self->_whichValue == 44) {
    v2 = self->_createContactCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCreateContactCommand:(id)a3
{
  id v4 = (_SFPBCreateContactCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 44;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = v4;
}

- (_SFPBClearProactiveCategoryCommand)clearProactiveCategoryCommand
{
  if (self->_whichValue == 43) {
    v2 = self->_clearProactiveCategoryCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setClearProactiveCategoryCommand:(id)a3
{
  id v4 = (_SFPBClearProactiveCategoryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 43;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = v4;
}

- (_SFPBShowWrapperResponseViewCommand)showWrapperResponseViewCommand
{
  if (self->_whichValue == 42) {
    v2 = self->_showWrapperResponseViewCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShowWrapperResponseViewCommand:(id)a3
{
  id v4 = (_SFPBShowWrapperResponseViewCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 42;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = v4;
}

- (_SFPBRejectPeopleInPhotoCommand)rejectPeopleInPhotoCommand
{
  if (self->_whichValue == 41) {
    v2 = self->_rejectPeopleInPhotoCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRejectPeopleInPhotoCommand:(id)a3
{
  id v4 = (_SFPBRejectPeopleInPhotoCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 41;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = v4;
}

- (_SFPBViewEmailCommand)viewEmailCommand
{
  if (self->_whichValue == 40) {
    v2 = self->_viewEmailCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setViewEmailCommand:(id)a3
{
  id v4 = (_SFPBViewEmailCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 40;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = v4;
}

- (_SFPBSubscribeForUpdatesCommand)subscribeForUpdatesCommand
{
  if (self->_whichValue == 39) {
    v2 = self->_subscribeForUpdatesCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSubscribeForUpdatesCommand:(id)a3
{
  id v4 = (_SFPBSubscribeForUpdatesCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 39;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = v4;
}

- (_SFPBExpandInlineCommand)expandInlineCommand
{
  if (self->_whichValue == 38) {
    v2 = self->_expandInlineCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setExpandInlineCommand:(id)a3
{
  id v4 = (_SFPBExpandInlineCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 38;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = v4;
}

- (_SFPBPerformContactActionCommand)performContactActionCommand
{
  if (self->_whichValue == 37) {
    v2 = self->_performContactActionCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPerformContactActionCommand:(id)a3
{
  id v4 = (_SFPBPerformContactActionCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 37;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = v4;
}

- (_SFPBAddToPhotosLibraryCommand)addToPhotosLibraryCommand
{
  if (self->_whichValue == 36) {
    v2 = self->_addToPhotosLibraryCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAddToPhotosLibraryCommand:(id)a3
{
  id v4 = (_SFPBAddToPhotosLibraryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 36;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = v4;
}

- (_SFPBOpenMediaCommand)openMediaCommand
{
  if (self->_whichValue == 35) {
    v2 = self->_openMediaCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenMediaCommand:(id)a3
{
  id v4 = (_SFPBOpenMediaCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 35;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = v4;
}

- (_SFPBPlayMediaCommand)playMediaCommand
{
  if (self->_whichValue == 34) {
    v2 = self->_playMediaCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPlayMediaCommand:(id)a3
{
  id v4 = (_SFPBPlayMediaCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 34;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = v4;
}

- (_SFPBShowPhotosOneUpViewCommand)showPhotosOneUpViewCommand
{
  if (self->_whichValue == 33) {
    v2 = self->_showPhotosOneUpViewCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShowPhotosOneUpViewCommand:(id)a3
{
  id v4 = (_SFPBShowPhotosOneUpViewCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 33;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = v4;
}

- (_SFPBToggleWatchListStatusCommand)toggleWatchListStatusCommand
{
  if (self->_whichValue == 32) {
    v2 = self->_toggleWatchListStatusCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setToggleWatchListStatusCommand:(id)a3
{
  id v4 = (_SFPBToggleWatchListStatusCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  self->_whichValue = 32 * (v4 != 0);
  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = v4;
}

- (_SFPBCopyCommand)copyCommand
{
  if (self->_whichValue == 31) {
    return self->_copyCommand;
  }
  else {
    return 0;
  }
}

- (void)setCopyCommand:(id)a3
{
  id v4 = (_SFPBCopyCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 31;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  copyCommand = self->_copyCommand;
  self->_copyCommand = v4;
}

- (_SFPBShareCommand)shareCommand
{
  if (self->_whichValue == 30) {
    v2 = self->_shareCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShareCommand:(id)a3
{
  id v4 = (_SFPBShareCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 30;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  shareCommand = self->_shareCommand;
  self->_shareCommand = v4;
}

- (_SFPBPerformEntityQueryCommand)performEntityQueryCommand
{
  if (self->_whichValue == 29) {
    v2 = self->_performEntityQueryCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPerformEntityQueryCommand:(id)a3
{
  id v4 = (_SFPBPerformEntityQueryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 29;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = v4;
}

- (_SFPBShowScreenTimeRequestSheetCommand)showScreenTimeRequestSheetCommand
{
  if (self->_whichValue == 28) {
    v2 = self->_showScreenTimeRequestSheetCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShowScreenTimeRequestSheetCommand:(id)a3
{
  id v4 = (_SFPBShowScreenTimeRequestSheetCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 28;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = v4;
}

- (_SFPBShowPurchaseRequestSheetCommand)showPurchaseRequestSheetCommand
{
  if (self->_whichValue == 27) {
    v2 = self->_showPurchaseRequestSheetCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShowPurchaseRequestSheetCommand:(id)a3
{
  id v4 = (_SFPBShowPurchaseRequestSheetCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 27;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = v4;
}

- (_SFPBPerformPersonEntityQueryCommand)performPersonEntityQueryCommand
{
  if (self->_whichValue == 26) {
    v2 = self->_performPersonEntityQueryCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPerformPersonEntityQueryCommand:(id)a3
{
  id v4 = (_SFPBPerformPersonEntityQueryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 26;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = v4;
}

- (_SFPBToggleAudioCommand)toggleAudioCommand
{
  if (self->_whichValue == 25) {
    v2 = self->_toggleAudioCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setToggleAudioCommand:(id)a3
{
  id v4 = (_SFPBToggleAudioCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 25;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = v4;
}

- (_SFPBBeginMapsRoutingCommand)beginMapsRoutingCommand
{
  if (self->_whichValue == 24) {
    v2 = self->_beginMapsRoutingCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setBeginMapsRoutingCommand:(id)a3
{
  id v4 = (_SFPBBeginMapsRoutingCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 24;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = v4;
}

- (_SFPBEmailCommand)emailCommand
{
  if (self->_whichValue == 23) {
    v2 = self->_emailCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEmailCommand:(id)a3
{
  id v4 = (_SFPBEmailCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 23;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  emailCommand = self->_emailCommand;
  self->_emailCommand = v4;
}

- (_SFPBCallCommand)callCommand
{
  if (self->_whichValue == 22) {
    v2 = self->_callCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCallCommand:(id)a3
{
  id v4 = (_SFPBCallCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 22;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  callCommand = self->_callCommand;
  self->_callCommand = v4;
}

- (_SFPBPlayVideoCommand)playVideoCommand
{
  if (self->_whichValue == 21) {
    v2 = self->_playVideoCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPlayVideoCommand:(id)a3
{
  id v4 = (_SFPBPlayVideoCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 21;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = v4;
}

- (_SFPBOpenCalculationCommand)openCalculationCommand
{
  if (self->_whichValue == 20) {
    v2 = self->_openCalculationCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenCalculationCommand:(id)a3
{
  id v4 = (_SFPBOpenCalculationCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 20;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = v4;
}

- (_SFPBPerformContactQueryCommand)performContactQueryCommand
{
  if (self->_whichValue == 19) {
    v2 = self->_performContactQueryCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPerformContactQueryCommand:(id)a3
{
  id v4 = (_SFPBPerformContactQueryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 19;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = v4;
}

- (_SFPBInvokeSiriCommand)invokeSiriCommand
{
  if (self->_whichValue == 18) {
    v2 = self->_invokeSiriCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInvokeSiriCommand:(id)a3
{
  id v4 = (_SFPBInvokeSiriCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 18;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = v4;
}

- (_SFPBSearchWebCommand)searchWebCommand
{
  if (self->_whichValue == 17) {
    v2 = self->_searchWebCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSearchWebCommand:(id)a3
{
  id v4 = (_SFPBSearchWebCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 17;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = v4;
}

- (_SFPBUpdateSearchQueryCommand)updateSearchQueryCommand
{
  if (self->_whichValue == 16) {
    v2 = self->_updateSearchQueryCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUpdateSearchQueryCommand:(id)a3
{
  id v4 = (_SFPBUpdateSearchQueryCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  self->_whichValue = 16 * (v4 != 0);
  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = v4;
}

- (_SFPBSearchInAppCommand)searchInAppCommand
{
  if (self->_whichValue == 15) {
    v2 = self->_searchInAppCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSearchInAppCommand:(id)a3
{
  id v4 = (_SFPBSearchInAppCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 15;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = v4;
}

- (_SFPBPerformIntentCommand)performIntentCommand
{
  if (self->_whichValue == 14) {
    v2 = self->_performIntentCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPerformIntentCommand:(id)a3
{
  id v4 = (_SFPBPerformIntentCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 14;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = v4;
}

- (_SFPBOpenCoreSpotlightItemCommand)openCoreSpotlightItemCommand
{
  if (self->_whichValue == 13) {
    v2 = self->_openCoreSpotlightItemCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenCoreSpotlightItemCommand:(id)a3
{
  id v4 = (_SFPBOpenCoreSpotlightItemCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 13;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = v4;
}

- (_SFPBIndexedUserActivityCommand)indexedUserActivityCommand
{
  if (self->_whichValue == 12) {
    v2 = self->_indexedUserActivityCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIndexedUserActivityCommand:(id)a3
{
  id v4 = (_SFPBIndexedUserActivityCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 12;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = v4;
}

- (_SFPBRunVoiceShortcutCommand)runVoiceShortcutCommand
{
  if (self->_whichValue == 11) {
    v2 = self->_runVoiceShortcutCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRunVoiceShortcutCommand:(id)a3
{
  id v4 = (_SFPBRunVoiceShortcutCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 11;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = v4;
}

- (_SFPBLaunchAppCommand)launchAppCommand
{
  if (self->_whichValue == 10) {
    v2 = self->_launchAppCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLaunchAppCommand:(id)a3
{
  id v4 = (_SFPBLaunchAppCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 10;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = v4;
}

- (_SFPBRequestUserReportCommand)requestUserReportCommand
{
  if (self->_whichValue == 9) {
    v2 = self->_requestUserReportCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestUserReportCommand:(id)a3
{
  id v4 = (_SFPBRequestUserReportCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 9;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = v4;
}

- (_SFPBRequestAppClipInstallCommand)requestAppClipInstallCommand
{
  if (self->_whichValue == 8) {
    v2 = self->_requestAppClipInstallCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRequestAppClipInstallCommand:(id)a3
{
  id v4 = (_SFPBRequestAppClipInstallCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  self->_whichValue = 8 * (v4 != 0);
  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = v4;
}

- (_SFPBOpenWebClipCommand)openWebClipCommand
{
  if (self->_whichValue == 7) {
    v2 = self->_openWebClipCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenWebClipCommand:(id)a3
{
  id v4 = (_SFPBOpenWebClipCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 7;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = v4;
}

- (_SFPBOpenAppClipCommand)openAppClipCommand
{
  if (self->_whichValue == 6) {
    v2 = self->_openAppClipCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenAppClipCommand:(id)a3
{
  id v4 = (_SFPBOpenAppClipCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 6;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = v4;
}

- (_SFPBOpenFileProviderItemCommand)openFileProviderItemCommand
{
  if (self->_whichValue == 5) {
    v2 = self->_openFileProviderItemCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenFileProviderItemCommand:(id)a3
{
  id v4 = (_SFPBOpenFileProviderItemCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 5;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = v4;
}

- (_SFPBOpenPunchoutCommand)openPunchoutCommand
{
  if (self->_whichValue == 4) {
    v2 = self->_openPunchoutCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOpenPunchoutCommand:(id)a3
{
  id v4 = (_SFPBOpenPunchoutCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  self->_whichValue = 4 * (v4 != 0);
  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = v4;
}

- (_SFPBShowAppStoreSheetCommand)showAppStoreSheetCommand
{
  if (self->_whichValue == 3) {
    v2 = self->_showAppStoreSheetCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShowAppStoreSheetCommand:(id)a3
{
  id v4 = (_SFPBShowAppStoreSheetCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  unint64_t v55 = 3;
  if (!v4) {
    unint64_t v55 = 0;
  }
  self->_whichValue = v55;
  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = v4;
}

- (_SFPBShowSFCardCommand)showSFCardCommand
{
  if (self->_whichValue == 2) {
    v2 = self->_showSFCardCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShowSFCardCommand:(id)a3
{
  id v4 = (_SFPBShowSFCardCommand *)a3;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  self->_whichValue = 2 * (v4 != 0);
  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = v4;
}

- (_SFPBShowContactCardCommand)showContactCardCommand
{
  if (self->_whichValue == 1) {
    v2 = self->_showContactCardCommand;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setShowContactCardCommand:(id)a3
{
  id v4 = (_SFPBShowContactCardCommand *)a3;
  showSFCardCommand = self->_showSFCardCommand;
  self->_showSFCardCommand = 0;

  showAppStoreSheetCommand = self->_showAppStoreSheetCommand;
  self->_showAppStoreSheetCommand = 0;

  openPunchoutCommand = self->_openPunchoutCommand;
  self->_openPunchoutCommand = 0;

  openFileProviderItemCommand = self->_openFileProviderItemCommand;
  self->_openFileProviderItemCommand = 0;

  openAppClipCommand = self->_openAppClipCommand;
  self->_openAppClipCommand = 0;

  openWebClipCommand = self->_openWebClipCommand;
  self->_openWebClipCommand = 0;

  requestAppClipInstallCommand = self->_requestAppClipInstallCommand;
  self->_requestAppClipInstallCommand = 0;

  requestUserReportCommand = self->_requestUserReportCommand;
  self->_requestUserReportCommand = 0;

  launchAppCommand = self->_launchAppCommand;
  self->_launchAppCommand = 0;

  runVoiceShortcutCommand = self->_runVoiceShortcutCommand;
  self->_runVoiceShortcutCommand = 0;

  indexedUserActivityCommand = self->_indexedUserActivityCommand;
  self->_indexedUserActivityCommand = 0;

  openCoreSpotlightItemCommand = self->_openCoreSpotlightItemCommand;
  self->_openCoreSpotlightItemCommand = 0;

  performIntentCommand = self->_performIntentCommand;
  self->_performIntentCommand = 0;

  searchInAppCommand = self->_searchInAppCommand;
  self->_searchInAppCommand = 0;

  updateSearchQueryCommand = self->_updateSearchQueryCommand;
  self->_updateSearchQueryCommand = 0;

  searchWebCommand = self->_searchWebCommand;
  self->_searchWebCommand = 0;

  invokeSiriCommand = self->_invokeSiriCommand;
  self->_invokeSiriCommand = 0;

  performContactQueryCommand = self->_performContactQueryCommand;
  self->_performContactQueryCommand = 0;

  openCalculationCommand = self->_openCalculationCommand;
  self->_openCalculationCommand = 0;

  playVideoCommand = self->_playVideoCommand;
  self->_playVideoCommand = 0;

  callCommand = self->_callCommand;
  self->_callCommand = 0;

  emailCommand = self->_emailCommand;
  self->_emailCommand = 0;

  beginMapsRoutingCommand = self->_beginMapsRoutingCommand;
  self->_beginMapsRoutingCommand = 0;

  toggleAudioCommand = self->_toggleAudioCommand;
  self->_toggleAudioCommand = 0;

  performPersonEntityQueryCommand = self->_performPersonEntityQueryCommand;
  self->_performPersonEntityQueryCommand = 0;

  showPurchaseRequestSheetCommand = self->_showPurchaseRequestSheetCommand;
  self->_showPurchaseRequestSheetCommand = 0;

  showScreenTimeRequestSheetCommand = self->_showScreenTimeRequestSheetCommand;
  self->_showScreenTimeRequestSheetCommand = 0;

  performEntityQueryCommand = self->_performEntityQueryCommand;
  self->_performEntityQueryCommand = 0;

  shareCommand = self->_shareCommand;
  self->_shareCommand = 0;

  copyCommand = self->_copyCommand;
  self->_copyCommand = 0;

  toggleWatchListStatusCommand = self->_toggleWatchListStatusCommand;
  self->_toggleWatchListStatusCommand = 0;

  showPhotosOneUpViewCommand = self->_showPhotosOneUpViewCommand;
  self->_showPhotosOneUpViewCommand = 0;

  playMediaCommand = self->_playMediaCommand;
  self->_playMediaCommand = 0;

  openMediaCommand = self->_openMediaCommand;
  self->_openMediaCommand = 0;

  addToPhotosLibraryCommand = self->_addToPhotosLibraryCommand;
  self->_addToPhotosLibraryCommand = 0;

  performContactActionCommand = self->_performContactActionCommand;
  self->_performContactActionCommand = 0;

  expandInlineCommand = self->_expandInlineCommand;
  self->_expandInlineCommand = 0;

  subscribeForUpdatesCommand = self->_subscribeForUpdatesCommand;
  self->_subscribeForUpdatesCommand = 0;

  viewEmailCommand = self->_viewEmailCommand;
  self->_viewEmailCommand = 0;

  rejectPeopleInPhotoCommand = self->_rejectPeopleInPhotoCommand;
  self->_rejectPeopleInPhotoCommand = 0;

  showWrapperResponseViewCommand = self->_showWrapperResponseViewCommand;
  self->_showWrapperResponseViewCommand = 0;

  clearProactiveCategoryCommand = self->_clearProactiveCategoryCommand;
  self->_clearProactiveCategoryCommand = 0;

  createContactCommand = self->_createContactCommand;
  self->_createContactCommand = 0;

  createCalendarEventCommand = self->_createCalendarEventCommand;
  self->_createCalendarEventCommand = 0;

  createReminderCommand = self->_createReminderCommand;
  self->_createReminderCommand = 0;

  manageReservationCommand = self->_manageReservationCommand;
  self->_manageReservationCommand = 0;

  updateSportsFollowingStatusCommand = self->_updateSportsFollowingStatusCommand;
  self->_updateSportsFollowingStatusCommand = 0;

  requestProductPageCommand = self->_requestProductPageCommand;
  self->_requestProductPageCommand = 0;

  flightCheckinCommand = self->_flightCheckinCommand;
  self->_flightCheckinCommand = 0;

  executeToolCommand = self->_executeToolCommand;
  self->_executeToolCommand = 0;

  self->_whichValue = v4 != 0;
  showContactCardCommand = self->_showContactCardCommand;
  self->_showContactCardCommand = v4;
}

@end