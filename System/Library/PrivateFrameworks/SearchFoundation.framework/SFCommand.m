@interface SFCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)backendData;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)commandDetail;
- (SFCommand)initWithCoder:(id)a3;
- (SFCommand)initWithProtobuf:(id)a3;
- (SFCommandReference)commandReference;
- (SFTopic)normalizedTopic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)embeddedCards;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBackendData:(id)a3;
- (void)setCommandDetail:(id)a3;
- (void)setCommandReference:(id)a3;
- (void)setNormalizedTopic:(id)a3;
@end

@implementation SFCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReference, 0);
  objc_storeStrong((id *)&self->_backendData, 0);
  objc_storeStrong((id *)&self->_normalizedTopic, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
}

- (void)setCommandReference:(id)a3
{
}

- (SFCommandReference)commandReference
{
  return self->_commandReference;
}

- (void)setBackendData:(id)a3
{
}

- (NSData)backendData
{
  return self->_backendData;
}

- (void)setNormalizedTopic:(id)a3
{
}

- (SFTopic)normalizedTopic
{
  return self->_normalizedTopic;
}

- (void)setCommandDetail:(id)a3
{
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (unint64_t)hash
{
  v3 = [(SFCommand *)self commandDetail];
  uint64_t v4 = [v3 hash];
  v5 = [(SFCommand *)self normalizedTopic];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFCommand *)self backendData];
  uint64_t v8 = [v7 hash];
  v9 = [(SFCommand *)self commandReference];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFCommand *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFCommand *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFCommand *)self commandDetail];
      uint64_t v8 = [(SFCommand *)v6 commandDetail];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v9 = [(SFCommand *)self commandDetail];
      if (v9)
      {
        unint64_t v10 = [(SFCommand *)self commandDetail];
        v3 = [(SFCommand *)v6 commandDetail];
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      v12 = [(SFCommand *)self normalizedTopic];
      v13 = [(SFCommand *)v6 normalizedTopic];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_34;
      }
      uint64_t v15 = [(SFCommand *)self normalizedTopic];
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        v18 = [(SFCommand *)self normalizedTopic];
        v37 = [(SFCommand *)v6 normalizedTopic];
        v38 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          char v11 = 0;
          v12 = v17;
          v14 = v35;
          goto LABEL_32;
        }
        v39 = v3;
        v12 = v17;
        v14 = v35;
      }
      else
      {
        v39 = v3;
      }
      v19 = [(SFCommand *)self backendData];
      v20 = [(SFCommand *)v6 backendData];
      if ((v19 == 0) == (v20 != 0))
      {

        char v11 = 0;
        v3 = v39;
        v16 = v40;
        if (!v40) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      v33 = v20;
      v34 = v19;
      [(SFCommand *)self backendData];
      v36 = v16 = v40;
      if (!v36
        || ([(SFCommand *)self backendData],
            v21 = objc_claimAutoreleasedReturnValue(),
            [(SFCommand *)v6 backendData],
            v31 = objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        v22 = [(SFCommand *)self commandReference];
        v23 = [(SFCommand *)v6 commandReference];
        if ((v22 == 0) == (v23 != 0))
        {

          char v11 = 0;
          v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          uint64_t v24 = [(SFCommand *)self commandReference];
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            v27 = [(SFCommand *)self commandReference];
            v25 = [(SFCommand *)v6 commandReference];
            char v11 = objc_msgSend(v27, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
        }
        v3 = v39;
        if (!v36)
        {
LABEL_31:

          if (!v16)
          {
LABEL_33:

LABEL_34:
            unint64_t v10 = v41;
            if (!v9)
            {
LABEL_36:

              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        char v11 = 0;
        v3 = v39;
      }

      goto LABEL_31;
    }
    char v11 = 0;
  }
LABEL_38:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFCommand *)self commandDetail];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setCommandDetail:v6];

  v7 = [(SFCommand *)self normalizedTopic];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setNormalizedTopic:v8];

  v9 = [(SFCommand *)self backendData];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setBackendData:v10];

  char v11 = [(SFCommand *)self commandReference];
  v12 = (void *)[v11 copy];
  [v4 setCommandReference:v12];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCommand alloc] initWithFacade:self];
  v3 = [(_SFPBCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCommand alloc] initWithFacade:self];
  v3 = [(_SFPBCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBCommand alloc] initWithFacade:self];
  v5 = [(_SFPBCommand *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [SFCommand alloc];
  v7 = [[_SFPBCommand alloc] initWithData:v5];
  uint64_t v8 = [(SFCommand *)v6 initWithProtobuf:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)SFCommand;
  v5 = [(SFCommand *)&v84 init];
  if (v5)
  {
    uint64_t v6 = [v4 commandDetail];

    if (v6)
    {
      v7 = [v4 commandDetail];
      [(SFCommand *)v5 setCommandDetail:v7];
    }
    uint64_t v8 = [v4 normalizedTopic];

    if (v8)
    {
      v9 = [v4 normalizedTopic];
      unint64_t v10 = _SFPBTopicHandwrittenTranslator(v9);
      [(SFCommand *)v5 setNormalizedTopic:v10];
    }
    char v11 = [v4 backendData];

    if (v11)
    {
      v12 = [v4 backendData];
      [(SFCommand *)v5 setBackendData:v12];
    }
    v13 = [v4 commandReference];

    if (v13)
    {
      v14 = [SFCommandReference alloc];
      uint64_t v15 = [v4 commandReference];
      v16 = [(SFCommandReference *)v14 initWithProtobuf:v15];
      [(SFCommand *)v5 setCommandReference:v16];
    }
    v17 = [v4 showContactCardCommand];

    if (v17)
    {
      v18 = [SFShowContactCardCommand alloc];
      uint64_t v19 = [v4 showContactCardCommand];
    }
    else
    {
      v21 = [v4 showSFCardCommand];

      if (v21)
      {
        v18 = [SFShowSFCardCommand alloc];
        uint64_t v19 = [v4 showSFCardCommand];
      }
      else
      {
        v22 = [v4 showAppStoreSheetCommand];

        if (v22)
        {
          v18 = [SFShowAppStoreSheetCommand alloc];
          uint64_t v19 = [v4 showAppStoreSheetCommand];
        }
        else
        {
          v23 = [v4 openPunchoutCommand];

          if (v23)
          {
            v18 = [SFOpenPunchoutCommand alloc];
            uint64_t v19 = [v4 openPunchoutCommand];
          }
          else
          {
            uint64_t v24 = [v4 openFileProviderItemCommand];

            if (v24)
            {
              v18 = [SFOpenFileProviderItemCommand alloc];
              uint64_t v19 = [v4 openFileProviderItemCommand];
            }
            else
            {
              v25 = [v4 openAppClipCommand];

              if (v25)
              {
                v18 = [SFOpenAppClipCommand alloc];
                uint64_t v19 = [v4 openAppClipCommand];
              }
              else
              {
                v26 = [v4 openWebClipCommand];

                if (v26)
                {
                  v18 = [SFOpenWebClipCommand alloc];
                  uint64_t v19 = [v4 openWebClipCommand];
                }
                else
                {
                  v27 = [v4 requestAppClipInstallCommand];

                  if (v27)
                  {
                    v18 = [SFRequestAppClipInstallCommand alloc];
                    uint64_t v19 = [v4 requestAppClipInstallCommand];
                  }
                  else
                  {
                    v28 = [v4 requestUserReportCommand];

                    if (v28)
                    {
                      v18 = [SFRequestUserReportCommand alloc];
                      uint64_t v19 = [v4 requestUserReportCommand];
                    }
                    else
                    {
                      v29 = [v4 launchAppCommand];

                      if (v29)
                      {
                        v18 = [SFLaunchAppCommand alloc];
                        uint64_t v19 = [v4 launchAppCommand];
                      }
                      else
                      {
                        v30 = [v4 runVoiceShortcutCommand];

                        if (v30)
                        {
                          v18 = [SFRunVoiceShortcutCommand alloc];
                          uint64_t v19 = [v4 runVoiceShortcutCommand];
                        }
                        else
                        {
                          v31 = [v4 indexedUserActivityCommand];

                          if (v31)
                          {
                            v18 = [SFIndexedUserActivityCommand alloc];
                            uint64_t v19 = [v4 indexedUserActivityCommand];
                          }
                          else
                          {
                            v32 = [v4 openCoreSpotlightItemCommand];

                            if (v32)
                            {
                              v18 = [SFOpenCoreSpotlightItemCommand alloc];
                              uint64_t v19 = [v4 openCoreSpotlightItemCommand];
                            }
                            else
                            {
                              v33 = [v4 performIntentCommand];

                              if (v33)
                              {
                                v18 = [SFPerformIntentCommand alloc];
                                uint64_t v19 = [v4 performIntentCommand];
                              }
                              else
                              {
                                v34 = [v4 searchInAppCommand];

                                if (v34)
                                {
                                  v18 = [SFSearchInAppCommand alloc];
                                  uint64_t v19 = [v4 searchInAppCommand];
                                }
                                else
                                {
                                  v35 = [v4 updateSearchQueryCommand];

                                  if (v35)
                                  {
                                    v18 = [SFUpdateSearchQueryCommand alloc];
                                    uint64_t v19 = [v4 updateSearchQueryCommand];
                                  }
                                  else
                                  {
                                    v36 = [v4 searchWebCommand];

                                    if (v36)
                                    {
                                      v18 = [SFSearchWebCommand alloc];
                                      uint64_t v19 = [v4 searchWebCommand];
                                    }
                                    else
                                    {
                                      v37 = [v4 invokeSiriCommand];

                                      if (v37)
                                      {
                                        v18 = [SFInvokeSiriCommand alloc];
                                        uint64_t v19 = [v4 invokeSiriCommand];
                                      }
                                      else
                                      {
                                        v38 = [v4 performContactQueryCommand];

                                        if (v38)
                                        {
                                          v18 = [SFPerformContactQueryCommand alloc];
                                          uint64_t v19 = [v4 performContactQueryCommand];
                                        }
                                        else
                                        {
                                          v39 = [v4 openCalculationCommand];

                                          if (v39)
                                          {
                                            v18 = [SFOpenCalculationCommand alloc];
                                            uint64_t v19 = [v4 openCalculationCommand];
                                          }
                                          else
                                          {
                                            v40 = [v4 playVideoCommand];

                                            if (v40)
                                            {
                                              v18 = [SFPlayVideoCommand alloc];
                                              uint64_t v19 = [v4 playVideoCommand];
                                            }
                                            else
                                            {
                                              v41 = [v4 callCommand];

                                              if (v41)
                                              {
                                                v18 = [SFCallCommand alloc];
                                                uint64_t v19 = [v4 callCommand];
                                              }
                                              else
                                              {
                                                v42 = [v4 emailCommand];

                                                if (v42)
                                                {
                                                  v18 = [SFEmailCommand alloc];
                                                  uint64_t v19 = [v4 emailCommand];
                                                }
                                                else
                                                {
                                                  v43 = [v4 beginMapsRoutingCommand];

                                                  if (v43)
                                                  {
                                                    v18 = [SFBeginMapsRoutingCommand alloc];
                                                    uint64_t v19 = [v4 beginMapsRoutingCommand];
                                                  }
                                                  else
                                                  {
                                                    v44 = [v4 toggleAudioCommand];

                                                    if (v44)
                                                    {
                                                      v18 = [SFToggleAudioCommand alloc];
                                                      uint64_t v19 = [v4 toggleAudioCommand];
                                                    }
                                                    else
                                                    {
                                                      v45 = [v4 performPersonEntityQueryCommand];

                                                      if (v45)
                                                      {
                                                        v18 = [SFPerformPersonEntityQueryCommand alloc];
                                                        uint64_t v19 = [v4 performPersonEntityQueryCommand];
                                                      }
                                                      else
                                                      {
                                                        v46 = [v4 showPurchaseRequestSheetCommand];

                                                        if (v46)
                                                        {
                                                          v18 = [SFShowPurchaseRequestSheetCommand alloc];
                                                          uint64_t v19 = [v4 showPurchaseRequestSheetCommand];
                                                        }
                                                        else
                                                        {
                                                          v47 = [v4 showScreenTimeRequestSheetCommand];

                                                          if (v47)
                                                          {
                                                            v18 = [SFShowScreenTimeRequestSheetCommand alloc];
                                                            uint64_t v19 = [v4 showScreenTimeRequestSheetCommand];
                                                          }
                                                          else
                                                          {
                                                            v48 = [v4 performEntityQueryCommand];

                                                            if (v48)
                                                            {
                                                              v18 = [SFPerformEntityQueryCommand alloc];
                                                              uint64_t v19 = [v4 performEntityQueryCommand];
                                                            }
                                                            else
                                                            {
                                                              v49 = [v4 shareCommand];

                                                              if (v49)
                                                              {
                                                                v18 = [SFShareCommand alloc];
                                                                uint64_t v19 = [v4 shareCommand];
                                                              }
                                                              else
                                                              {
                                                                v50 = (void *)[v4 copyCommand];

                                                                if (v50)
                                                                {
                                                                  v18 = [SFCopyCommand alloc];
                                                                  uint64_t v19 = [v4 copyCommand];
                                                                }
                                                                else
                                                                {
                                                                  v51 = [v4 toggleWatchListStatusCommand];

                                                                  if (v51)
                                                                  {
                                                                    v18 = [SFToggleWatchListStatusCommand alloc];
                                                                    uint64_t v19 = [v4 toggleWatchListStatusCommand];
                                                                  }
                                                                  else
                                                                  {
                                                                    v52 = [v4 showPhotosOneUpViewCommand];

                                                                    if (v52)
                                                                    {
                                                                      v18 = [SFShowPhotosOneUpViewCommand alloc];
                                                                      uint64_t v19 = [v4 showPhotosOneUpViewCommand];
                                                                    }
                                                                    else
                                                                    {
                                                                      v53 = [v4 playMediaCommand];

                                                                      if (v53)
                                                                      {
                                                                        v18 = [SFPlayMediaCommand alloc];
                                                                        uint64_t v19 = [v4 playMediaCommand];
                                                                      }
                                                                      else
                                                                      {
                                                                        v54 = [v4 openMediaCommand];

                                                                        if (v54)
                                                                        {
                                                                          v18 = [SFOpenMediaCommand alloc];
                                                                          uint64_t v19 = [v4 openMediaCommand];
                                                                        }
                                                                        else
                                                                        {
                                                                          v55 = [v4 addToPhotosLibraryCommand];

                                                                          if (v55)
                                                                          {
                                                                            v18 = [SFAddToPhotosLibraryCommand alloc];
                                                                            uint64_t v19 = [v4 addToPhotosLibraryCommand];
                                                                          }
                                                                          else
                                                                          {
                                                                            v56 = [v4 performContactActionCommand];

                                                                            if (v56)
                                                                            {
                                                                              v18 = [SFPerformContactActionCommand alloc];
                                                                              uint64_t v19 = [v4 performContactActionCommand];
                                                                            }
                                                                            else
                                                                            {
                                                                              v57 = [v4 expandInlineCommand];

                                                                              if (v57)
                                                                              {
                                                                                v18 = [SFExpandInlineCommand alloc];
                                                                                uint64_t v19 = [v4 expandInlineCommand];
                                                                              }
                                                                              else
                                                                              {
                                                                                v58 = [v4 subscribeForUpdatesCommand];

                                                                                if (v58)
                                                                                {
                                                                                  v18 = [SFSubscribeForUpdatesCommand alloc];
                                                                                  uint64_t v19 = [v4 subscribeForUpdatesCommand];
                                                                                }
                                                                                else
                                                                                {
                                                                                  v59 = [v4 viewEmailCommand];

                                                                                  if (v59)
                                                                                  {
                                                                                    v18 = [SFViewEmailCommand alloc];
                                                                                    uint64_t v19 = [v4 viewEmailCommand];
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v60 = [v4 rejectPeopleInPhotoCommand];

                                                                                    if (v60)
                                                                                    {
                                                                                      v18 = [SFRejectPeopleInPhotoCommand alloc];
                                                                                      uint64_t v19 = [v4 rejectPeopleInPhotoCommand];
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v61 = [v4 showWrapperResponseViewCommand];

                                                                                      if (v61)
                                                                                      {
                                                                                        v18 = [SFShowWrapperResponseViewCommand alloc];
                                                                                        uint64_t v19 = [v4 showWrapperResponseViewCommand];
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v62 = [v4 clearProactiveCategoryCommand];

                                                                                        if (v62)
                                                                                        {
                                                                                          v18 = [SFClearProactiveCategoryCommand alloc];
                                                                                          uint64_t v19 = [v4 clearProactiveCategoryCommand];
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v63 = [v4 createContactCommand];

                                                                                          if (v63)
                                                                                          {
                                                                                            v18 = [SFCreateContactCommand alloc];
                                                                                            uint64_t v19 = [v4 createContactCommand];
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v64 = [v4 createCalendarEventCommand];

                                                                                            if (v64)
                                                                                            {
                                                                                              v18 = [SFCreateCalendarEventCommand alloc];
                                                                                              uint64_t v19 = [v4 createCalendarEventCommand];
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v65 = [v4 createReminderCommand];

                                                                                              if (v65)
                                                                                              {
                                                                                                v18 = [SFCreateReminderCommand alloc];
                                                                                                uint64_t v19 = [v4 createReminderCommand];
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v66 = [v4 manageReservationCommand];

                                                                                                if (v66)
                                                                                                {
                                                                                                  v18 = [SFManageReservationCommand alloc];
                                                                                                  uint64_t v19 = [v4 manageReservationCommand];
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v67 = [v4 updateSportsFollowingStatusCommand];

                                                                                                  if (v67)
                                                                                                  {
                                                                                                    v18 = [SFUpdateSportsFollowingStatusCommand alloc];
                                                                                                    uint64_t v19 = [v4 updateSportsFollowingStatusCommand];
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v68 = [v4 requestProductPageCommand];

                                                                                                    if (v68)
                                                                                                    {
                                                                                                      v18 = [SFRequestProductPageCommand alloc];
                                                                                                      uint64_t v19 = [v4 requestProductPageCommand];
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v69 = [v4 flightCheckinCommand];

                                                                                                      if (v69)
                                                                                                      {
                                                                                                        v18 = [SFFlightCheckinCommand alloc];
                                                                                                        uint64_t v19 = [v4 flightCheckinCommand];
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v70 = [v4 executeToolCommand];

                                                                                                        if (!v70)
                                                                                                        {
                                                                                                          v20 = v5;
                                                                                                          goto LABEL_121;
                                                                                                        }
                                                                                                        v18 = [SFExecuteToolCommand alloc];
                                                                                                        uint64_t v19 = [v4 executeToolCommand];
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v71 = (void *)v19;
    v20 = [(SFShowContactCardCommand *)v18 initWithProtobuf:v19];

    v72 = [v4 commandDetail];

    if (v72)
    {
      v73 = [v4 commandDetail];
      [(SFCommand *)v20 setCommandDetail:v73];
    }
    v74 = [v4 normalizedTopic];

    if (v74)
    {
      v75 = [v4 normalizedTopic];
      v76 = _SFPBTopicHandwrittenTranslator(v75);
      [(SFCommand *)v20 setNormalizedTopic:v76];
    }
    v77 = [v4 backendData];

    if (v77)
    {
      v78 = [v4 backendData];
      [(SFCommand *)v20 setBackendData:v78];
    }
    v79 = [v4 commandReference];

    if (v79)
    {
      v80 = [SFCommandReference alloc];
      v81 = [v4 commandReference];
      v82 = [(SFCommandReference *)v80 initWithProtobuf:v81];
      [(SFCommand *)v20 setCommandReference:v82];
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_121:

  return v20;
}

- (id)embeddedCards
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end