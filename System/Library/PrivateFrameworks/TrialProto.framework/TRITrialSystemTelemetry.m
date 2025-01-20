@interface TRITrialSystemTelemetry
- (BOOL)hasAssetPurgeFields;
- (BOOL)hasBmltFields;
- (BOOL)hasClientDeploymentEnv;
- (BOOL)hasClientDeploymentId;
- (BOOL)hasClientProjectId;
- (BOOL)hasClientTeamId;
- (BOOL)hasContainerOriginFields;
- (BOOL)hasDownloadSettingsFields;
- (BOOL)hasDownloadStatusFields;
- (BOOL)hasExperimentFields;
- (BOOL)hasFactorFields;
- (BOOL)hasMobileAssetOriginFields;
- (BOOL)hasOnDemandFactorFields;
- (BOOL)hasPrevBcp47DeviceLocale;
- (BOOL)hasPrevCarrierBundleIdentifier;
- (BOOL)hasPrevCarrierCountryIsoCode;
- (BOOL)hasPrevExperimentOptOutStatus;
- (BOOL)hasPrevLanguageCode;
- (BOOL)hasPrevOsBuild;
- (BOOL)hasPrevRegionCode;
- (BOOL)hasRolloutFields;
- (BOOL)hasTrialdTaskName;
- (BOOL)isEqual:(id)a3;
- (BOOL)prevExperimentOptOutStatus;
- (BOOL)readFrom:(id)a3;
- (NSString)clientDeploymentEnv;
- (NSString)clientDeploymentId;
- (NSString)clientProjectId;
- (NSString)clientTeamId;
- (NSString)prevBcp47DeviceLocale;
- (NSString)prevCarrierBundleIdentifier;
- (NSString)prevCarrierCountryIsoCode;
- (NSString)prevLanguageCode;
- (NSString)prevOsBuild;
- (NSString)prevRegionCode;
- (NSString)trialdTaskName;
- (TRITrialAssetPurgeFields)assetPurgeFields;
- (TRITrialBMLTFields)bmltFields;
- (TRITrialCloudKitContainerOriginFields)containerOriginFields;
- (TRITrialDownloadSettingsFields)downloadSettingsFields;
- (TRITrialDownloadStatusFields)downloadStatusFields;
- (TRITrialExperimentFields)experimentFields;
- (TRITrialFactorFields)factorFields;
- (TRITrialMobileAssetOriginFields)mobileAssetOriginFields;
- (TRITrialOnDemandFactorFields)onDemandFactorFields;
- (TRITrialRolloutFields)rolloutFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ensureAssetPurgeFields;
- (id)ensureBMLTFields;
- (id)ensureExperimentFields;
- (id)ensureFactorFields;
- (id)ensureMobileAssetOriginFields;
- (id)ensureOnDemandFactorFields;
- (id)ensureRolloutFields;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetPurgeFields:(id)a3;
- (void)setBmltFields:(id)a3;
- (void)setClientDeploymentEnv:(id)a3;
- (void)setClientDeploymentId:(id)a3;
- (void)setClientProjectId:(id)a3;
- (void)setClientTeamId:(id)a3;
- (void)setContainerOriginFields:(id)a3;
- (void)setDownloadSettingsFields:(id)a3;
- (void)setDownloadStatusFields:(id)a3;
- (void)setExperimentFields:(id)a3;
- (void)setFactorFields:(id)a3;
- (void)setFieldsForDownloadOptions:(id)a3;
- (void)setFieldsForRolloutDeployment:(id)a3;
- (void)setHasPrevExperimentOptOutStatus:(BOOL)a3;
- (void)setMobileAssetOriginFields:(id)a3;
- (void)setOnDemandFactorFields:(id)a3;
- (void)setPrevBcp47DeviceLocale:(id)a3;
- (void)setPrevCarrierBundleIdentifier:(id)a3;
- (void)setPrevCarrierCountryIsoCode:(id)a3;
- (void)setPrevExperimentOptOutStatus:(BOOL)a3;
- (void)setPrevLanguageCode:(id)a3;
- (void)setPrevOsBuild:(id)a3;
- (void)setPrevRegionCode:(id)a3;
- (void)setRolloutFields:(id)a3;
- (void)setTrialdTaskName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialSystemTelemetry

- (BOOL)hasClientTeamId
{
  return self->_clientTeamId != 0;
}

- (BOOL)hasClientProjectId
{
  return self->_clientProjectId != 0;
}

- (BOOL)hasExperimentFields
{
  return self->_experimentFields != 0;
}

- (BOOL)hasRolloutFields
{
  return self->_rolloutFields != 0;
}

- (BOOL)hasClientDeploymentEnv
{
  return self->_clientDeploymentEnv != 0;
}

- (BOOL)hasTrialdTaskName
{
  return self->_trialdTaskName != 0;
}

- (BOOL)hasPrevOsBuild
{
  return self->_prevOsBuild != 0;
}

- (BOOL)hasPrevBcp47DeviceLocale
{
  return self->_prevBcp47DeviceLocale != 0;
}

- (BOOL)hasPrevLanguageCode
{
  return self->_prevLanguageCode != 0;
}

- (BOOL)hasPrevRegionCode
{
  return self->_prevRegionCode != 0;
}

- (BOOL)hasClientDeploymentId
{
  return self->_clientDeploymentId != 0;
}

- (BOOL)hasFactorFields
{
  return self->_factorFields != 0;
}

- (BOOL)hasDownloadSettingsFields
{
  return self->_downloadSettingsFields != 0;
}

- (BOOL)hasContainerOriginFields
{
  return self->_containerOriginFields != 0;
}

- (BOOL)hasAssetPurgeFields
{
  return self->_assetPurgeFields != 0;
}

- (BOOL)hasDownloadStatusFields
{
  return self->_downloadStatusFields != 0;
}

- (BOOL)hasOnDemandFactorFields
{
  return self->_onDemandFactorFields != 0;
}

- (BOOL)hasPrevCarrierCountryIsoCode
{
  return self->_prevCarrierCountryIsoCode != 0;
}

- (BOOL)hasPrevCarrierBundleIdentifier
{
  return self->_prevCarrierBundleIdentifier != 0;
}

- (void)setPrevExperimentOptOutStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_prevExperimentOptOutStatus = a3;
}

- (void)setHasPrevExperimentOptOutStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrevExperimentOptOutStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMobileAssetOriginFields
{
  return self->_mobileAssetOriginFields != 0;
}

- (BOOL)hasBmltFields
{
  return self->_bmltFields != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRITrialSystemTelemetry;
  v4 = [(TRITrialSystemTelemetry *)&v8 description];
  v5 = [(TRITrialSystemTelemetry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  clientTeamId = self->_clientTeamId;
  if (clientTeamId) {
    [v3 setObject:clientTeamId forKey:@"client_team_id"];
  }
  clientProjectId = self->_clientProjectId;
  if (clientProjectId) {
    [v4 setObject:clientProjectId forKey:@"client_project_id"];
  }
  experimentFields = self->_experimentFields;
  if (experimentFields)
  {
    objc_super v8 = [(TRITrialExperimentFields *)experimentFields dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"experiment_fields"];
  }
  rolloutFields = self->_rolloutFields;
  if (rolloutFields)
  {
    v10 = [(TRITrialRolloutFields *)rolloutFields dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"rollout_fields"];
  }
  clientDeploymentEnv = self->_clientDeploymentEnv;
  if (clientDeploymentEnv) {
    [v4 setObject:clientDeploymentEnv forKey:@"client_deployment_env"];
  }
  trialdTaskName = self->_trialdTaskName;
  if (trialdTaskName) {
    [v4 setObject:trialdTaskName forKey:@"triald_task_name"];
  }
  prevOsBuild = self->_prevOsBuild;
  if (prevOsBuild) {
    [v4 setObject:prevOsBuild forKey:@"prev_os_build"];
  }
  prevBcp47DeviceLocale = self->_prevBcp47DeviceLocale;
  if (prevBcp47DeviceLocale) {
    [v4 setObject:prevBcp47DeviceLocale forKey:@"prev_bcp47_device_locale"];
  }
  prevLanguageCode = self->_prevLanguageCode;
  if (prevLanguageCode) {
    [v4 setObject:prevLanguageCode forKey:@"prev_language_code"];
  }
  prevRegionCode = self->_prevRegionCode;
  if (prevRegionCode) {
    [v4 setObject:prevRegionCode forKey:@"prev_region_code"];
  }
  clientDeploymentId = self->_clientDeploymentId;
  if (clientDeploymentId) {
    [v4 setObject:clientDeploymentId forKey:@"client_deployment_id"];
  }
  factorFields = self->_factorFields;
  if (factorFields)
  {
    v19 = [(TRITrialFactorFields *)factorFields dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"factor_fields"];
  }
  downloadSettingsFields = self->_downloadSettingsFields;
  if (downloadSettingsFields)
  {
    v21 = [(TRITrialDownloadSettingsFields *)downloadSettingsFields dictionaryRepresentation];
    [v4 setObject:v21 forKey:@"download_settings_fields"];
  }
  containerOriginFields = self->_containerOriginFields;
  if (containerOriginFields)
  {
    v23 = [(TRITrialCloudKitContainerOriginFields *)containerOriginFields dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"container_origin_fields"];
  }
  assetPurgeFields = self->_assetPurgeFields;
  if (assetPurgeFields)
  {
    v25 = [(TRITrialAssetPurgeFields *)assetPurgeFields dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"asset_purge_fields"];
  }
  downloadStatusFields = self->_downloadStatusFields;
  if (downloadStatusFields)
  {
    v27 = [(TRITrialDownloadStatusFields *)downloadStatusFields dictionaryRepresentation];
    [v4 setObject:v27 forKey:@"download_status_fields"];
  }
  onDemandFactorFields = self->_onDemandFactorFields;
  if (onDemandFactorFields)
  {
    v29 = [(TRITrialOnDemandFactorFields *)onDemandFactorFields dictionaryRepresentation];
    [v4 setObject:v29 forKey:@"on_demand_factor_fields"];
  }
  prevCarrierCountryIsoCode = self->_prevCarrierCountryIsoCode;
  if (prevCarrierCountryIsoCode) {
    [v4 setObject:prevCarrierCountryIsoCode forKey:@"prev_carrier_country_iso_code"];
  }
  prevCarrierBundleIdentifier = self->_prevCarrierBundleIdentifier;
  if (prevCarrierBundleIdentifier) {
    [v4 setObject:prevCarrierBundleIdentifier forKey:@"prev_carrier_bundle_identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v32 = [NSNumber numberWithBool:self->_prevExperimentOptOutStatus];
    [v4 setObject:v32 forKey:@"prev_experiment_opt_out_status"];
  }
  mobileAssetOriginFields = self->_mobileAssetOriginFields;
  if (mobileAssetOriginFields)
  {
    v34 = [(TRITrialMobileAssetOriginFields *)mobileAssetOriginFields dictionaryRepresentation];
    [v4 setObject:v34 forKey:@"mobile_asset_origin_fields"];
  }
  bmltFields = self->_bmltFields;
  if (bmltFields)
  {
    v36 = [(TRITrialBMLTFields *)bmltFields dictionaryRepresentation];
    [v4 setObject:v36 forKey:@"bmlt_fields"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialSystemTelemetryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientTeamId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientProjectId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_experimentFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rolloutFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_clientDeploymentEnv)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_trialdTaskName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_prevOsBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_prevBcp47DeviceLocale)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_prevLanguageCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_prevRegionCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientDeploymentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_factorFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_downloadSettingsFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_containerOriginFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_assetPurgeFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_downloadStatusFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_onDemandFactorFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_prevCarrierCountryIsoCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_prevCarrierBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_mobileAssetOriginFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bmltFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientTeamId)
  {
    objc_msgSend(v4, "setClientTeamId:");
    id v4 = v5;
  }
  if (self->_clientProjectId)
  {
    objc_msgSend(v5, "setClientProjectId:");
    id v4 = v5;
  }
  if (self->_experimentFields)
  {
    objc_msgSend(v5, "setExperimentFields:");
    id v4 = v5;
  }
  if (self->_rolloutFields)
  {
    objc_msgSend(v5, "setRolloutFields:");
    id v4 = v5;
  }
  if (self->_clientDeploymentEnv)
  {
    objc_msgSend(v5, "setClientDeploymentEnv:");
    id v4 = v5;
  }
  if (self->_trialdTaskName)
  {
    objc_msgSend(v5, "setTrialdTaskName:");
    id v4 = v5;
  }
  if (self->_prevOsBuild)
  {
    objc_msgSend(v5, "setPrevOsBuild:");
    id v4 = v5;
  }
  if (self->_prevBcp47DeviceLocale)
  {
    objc_msgSend(v5, "setPrevBcp47DeviceLocale:");
    id v4 = v5;
  }
  if (self->_prevLanguageCode)
  {
    objc_msgSend(v5, "setPrevLanguageCode:");
    id v4 = v5;
  }
  if (self->_prevRegionCode)
  {
    objc_msgSend(v5, "setPrevRegionCode:");
    id v4 = v5;
  }
  if (self->_clientDeploymentId)
  {
    objc_msgSend(v5, "setClientDeploymentId:");
    id v4 = v5;
  }
  if (self->_factorFields)
  {
    objc_msgSend(v5, "setFactorFields:");
    id v4 = v5;
  }
  if (self->_downloadSettingsFields)
  {
    objc_msgSend(v5, "setDownloadSettingsFields:");
    id v4 = v5;
  }
  if (self->_containerOriginFields)
  {
    objc_msgSend(v5, "setContainerOriginFields:");
    id v4 = v5;
  }
  if (self->_assetPurgeFields)
  {
    objc_msgSend(v5, "setAssetPurgeFields:");
    id v4 = v5;
  }
  if (self->_downloadStatusFields)
  {
    objc_msgSend(v5, "setDownloadStatusFields:");
    id v4 = v5;
  }
  if (self->_onDemandFactorFields)
  {
    objc_msgSend(v5, "setOnDemandFactorFields:");
    id v4 = v5;
  }
  if (self->_prevCarrierCountryIsoCode)
  {
    objc_msgSend(v5, "setPrevCarrierCountryIsoCode:");
    id v4 = v5;
  }
  if (self->_prevCarrierBundleIdentifier)
  {
    objc_msgSend(v5, "setPrevCarrierBundleIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[176] = self->_prevExperimentOptOutStatus;
    v4[180] |= 1u;
  }
  if (self->_mobileAssetOriginFields)
  {
    objc_msgSend(v5, "setMobileAssetOriginFields:");
    id v4 = v5;
  }
  if (self->_bmltFields)
  {
    objc_msgSend(v5, "setBmltFields:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientTeamId copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_clientProjectId copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = [(TRITrialExperimentFields *)self->_experimentFields copyWithZone:a3];
  v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  id v12 = [(TRITrialRolloutFields *)self->_rolloutFields copyWithZone:a3];
  v13 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v12;

  uint64_t v14 = [(NSString *)self->_clientDeploymentEnv copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  uint64_t v16 = [(NSString *)self->_trialdTaskName copyWithZone:a3];
  v17 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v16;

  uint64_t v18 = [(NSString *)self->_prevOsBuild copyWithZone:a3];
  v19 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v18;

  uint64_t v20 = [(NSString *)self->_prevBcp47DeviceLocale copyWithZone:a3];
  v21 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v20;

  uint64_t v22 = [(NSString *)self->_prevLanguageCode copyWithZone:a3];
  v23 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v22;

  uint64_t v24 = [(NSString *)self->_prevRegionCode copyWithZone:a3];
  v25 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v24;

  uint64_t v26 = [(NSString *)self->_clientDeploymentId copyWithZone:a3];
  v27 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v26;

  id v28 = [(TRITrialFactorFields *)self->_factorFields copyWithZone:a3];
  v29 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v28;

  id v30 = [(TRITrialDownloadSettingsFields *)self->_downloadSettingsFields copyWithZone:a3];
  v31 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v30;

  id v32 = [(TRITrialCloudKitContainerOriginFields *)self->_containerOriginFields copyWithZone:a3];
  v33 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v32;

  id v34 = [(TRITrialAssetPurgeFields *)self->_assetPurgeFields copyWithZone:a3];
  v35 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v34;

  id v36 = [(TRITrialDownloadStatusFields *)self->_downloadStatusFields copyWithZone:a3];
  v37 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v36;

  id v38 = [(TRITrialOnDemandFactorFields *)self->_onDemandFactorFields copyWithZone:a3];
  v39 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v38;

  uint64_t v40 = [(NSString *)self->_prevCarrierCountryIsoCode copyWithZone:a3];
  v41 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v40;

  uint64_t v42 = [(NSString *)self->_prevCarrierBundleIdentifier copyWithZone:a3];
  v43 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v42;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 176) = self->_prevExperimentOptOutStatus;
    *(unsigned char *)(v5 + 180) |= 1u;
  }
  id v44 = [(TRITrialMobileAssetOriginFields *)self->_mobileAssetOriginFields copyWithZone:a3];
  v45 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v44;

  id v46 = [(TRITrialBMLTFields *)self->_bmltFields copyWithZone:a3];
  v47 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v46;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  clientTeamId = self->_clientTeamId;
  if ((unint64_t)clientTeamId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](clientTeamId, "isEqual:")) {
      goto LABEL_52;
    }
  }
  clientProjectId = self->_clientProjectId;
  if ((unint64_t)clientProjectId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](clientProjectId, "isEqual:")) {
      goto LABEL_52;
    }
  }
  experimentFields = self->_experimentFields;
  if ((unint64_t)experimentFields | *((void *)v4 + 10))
  {
    if (!-[TRITrialExperimentFields isEqual:](experimentFields, "isEqual:")) {
      goto LABEL_52;
    }
  }
  rolloutFields = self->_rolloutFields;
  if ((unint64_t)rolloutFields | *((void *)v4 + 20))
  {
    if (!-[TRITrialRolloutFields isEqual:](rolloutFields, "isEqual:")) {
      goto LABEL_52;
    }
  }
  clientDeploymentEnv = self->_clientDeploymentEnv;
  if ((unint64_t)clientDeploymentEnv | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientDeploymentEnv, "isEqual:")) {
      goto LABEL_52;
    }
  }
  trialdTaskName = self->_trialdTaskName;
  if ((unint64_t)trialdTaskName | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](trialdTaskName, "isEqual:")) {
      goto LABEL_52;
    }
  }
  prevOsBuild = self->_prevOsBuild;
  if ((unint64_t)prevOsBuild | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](prevOsBuild, "isEqual:")) {
      goto LABEL_52;
    }
  }
  prevBcp47DeviceLocale = self->_prevBcp47DeviceLocale;
  if ((unint64_t)prevBcp47DeviceLocale | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](prevBcp47DeviceLocale, "isEqual:")) {
      goto LABEL_52;
    }
  }
  prevLanguageCode = self->_prevLanguageCode;
  if ((unint64_t)prevLanguageCode | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](prevLanguageCode, "isEqual:")) {
      goto LABEL_52;
    }
  }
  prevRegionCode = self->_prevRegionCode;
  if ((unint64_t)prevRegionCode | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](prevRegionCode, "isEqual:")) {
      goto LABEL_52;
    }
  }
  clientDeploymentId = self->_clientDeploymentId;
  if ((unint64_t)clientDeploymentId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientDeploymentId, "isEqual:")) {
      goto LABEL_52;
    }
  }
  factorFields = self->_factorFields;
  if ((unint64_t)factorFields | *((void *)v4 + 11))
  {
    if (!-[TRITrialFactorFields isEqual:](factorFields, "isEqual:")) {
      goto LABEL_52;
    }
  }
  downloadSettingsFields = self->_downloadSettingsFields;
  if ((unint64_t)downloadSettingsFields | *((void *)v4 + 8))
  {
    if (!-[TRITrialDownloadSettingsFields isEqual:](downloadSettingsFields, "isEqual:")) {
      goto LABEL_52;
    }
  }
  containerOriginFields = self->_containerOriginFields;
  if ((unint64_t)containerOriginFields | *((void *)v4 + 7))
  {
    if (!-[TRITrialCloudKitContainerOriginFields isEqual:](containerOriginFields, "isEqual:")) {
      goto LABEL_52;
    }
  }
  assetPurgeFields = self->_assetPurgeFields;
  if ((unint64_t)assetPurgeFields | *((void *)v4 + 1))
  {
    if (!-[TRITrialAssetPurgeFields isEqual:](assetPurgeFields, "isEqual:")) {
      goto LABEL_52;
    }
  }
  downloadStatusFields = self->_downloadStatusFields;
  if ((unint64_t)downloadStatusFields | *((void *)v4 + 9))
  {
    if (!-[TRITrialDownloadStatusFields isEqual:](downloadStatusFields, "isEqual:")) {
      goto LABEL_52;
    }
  }
  onDemandFactorFields = self->_onDemandFactorFields;
  if ((unint64_t)onDemandFactorFields | *((void *)v4 + 13))
  {
    if (!-[TRITrialOnDemandFactorFields isEqual:](onDemandFactorFields, "isEqual:")) {
      goto LABEL_52;
    }
  }
  prevCarrierCountryIsoCode = self->_prevCarrierCountryIsoCode;
  if ((unint64_t)prevCarrierCountryIsoCode | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](prevCarrierCountryIsoCode, "isEqual:")) {
      goto LABEL_52;
    }
  }
  prevCarrierBundleIdentifier = self->_prevCarrierBundleIdentifier;
  if ((unint64_t)prevCarrierBundleIdentifier | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](prevCarrierBundleIdentifier, "isEqual:")) {
      goto LABEL_52;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 180))
    {
      if (self->_prevExperimentOptOutStatus)
      {
        if (!*((unsigned char *)v4 + 176)) {
          goto LABEL_52;
        }
        goto LABEL_48;
      }
      if (!*((unsigned char *)v4 + 176)) {
        goto LABEL_48;
      }
    }
LABEL_52:
    char v26 = 0;
    goto LABEL_53;
  }
  if (*((unsigned char *)v4 + 180)) {
    goto LABEL_52;
  }
LABEL_48:
  mobileAssetOriginFields = self->_mobileAssetOriginFields;
  if ((unint64_t)mobileAssetOriginFields | *((void *)v4 + 12)
    && !-[TRITrialMobileAssetOriginFields isEqual:](mobileAssetOriginFields, "isEqual:"))
  {
    goto LABEL_52;
  }
  bmltFields = self->_bmltFields;
  if ((unint64_t)bmltFields | *((void *)v4 + 2)) {
    char v26 = -[TRITrialBMLTFields isEqual:](bmltFields, "isEqual:");
  }
  else {
    char v26 = 1;
  }
LABEL_53:

  return v26;
}

- (unint64_t)hash
{
  NSUInteger v25 = [(NSString *)self->_clientTeamId hash];
  NSUInteger v24 = [(NSString *)self->_clientProjectId hash];
  unint64_t v23 = [(TRITrialExperimentFields *)self->_experimentFields hash];
  unint64_t v22 = [(TRITrialRolloutFields *)self->_rolloutFields hash];
  NSUInteger v21 = [(NSString *)self->_clientDeploymentEnv hash];
  NSUInteger v20 = [(NSString *)self->_trialdTaskName hash];
  NSUInteger v19 = [(NSString *)self->_prevOsBuild hash];
  NSUInteger v18 = [(NSString *)self->_prevBcp47DeviceLocale hash];
  NSUInteger v17 = [(NSString *)self->_prevLanguageCode hash];
  NSUInteger v3 = [(NSString *)self->_prevRegionCode hash];
  NSUInteger v4 = [(NSString *)self->_clientDeploymentId hash];
  unint64_t v5 = [(TRITrialFactorFields *)self->_factorFields hash];
  unint64_t v6 = [(TRITrialDownloadSettingsFields *)self->_downloadSettingsFields hash];
  unint64_t v7 = [(TRITrialCloudKitContainerOriginFields *)self->_containerOriginFields hash];
  unint64_t v8 = [(TRITrialAssetPurgeFields *)self->_assetPurgeFields hash];
  unint64_t v9 = [(TRITrialDownloadStatusFields *)self->_downloadStatusFields hash];
  unint64_t v10 = [(TRITrialOnDemandFactorFields *)self->_onDemandFactorFields hash];
  NSUInteger v11 = [(NSString *)self->_prevCarrierCountryIsoCode hash];
  NSUInteger v12 = [(NSString *)self->_prevCarrierBundleIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v13 = 2654435761 * self->_prevExperimentOptOutStatus;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v15 = v10 ^ v11 ^ v12 ^ v13 ^ [(TRITrialMobileAssetOriginFields *)self->_mobileAssetOriginFields hash];
  return v14 ^ v15 ^ [(TRITrialBMLTFields *)self->_bmltFields hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  NSUInteger v25 = v4;
  if (*((void *)v4 + 6))
  {
    -[TRITrialSystemTelemetry setClientTeamId:](self, "setClientTeamId:");
    NSUInteger v4 = v25;
  }
  if (*((void *)v4 + 5))
  {
    -[TRITrialSystemTelemetry setClientProjectId:](self, "setClientProjectId:");
    NSUInteger v4 = v25;
  }
  experimentFields = self->_experimentFields;
  uint64_t v6 = *((void *)v4 + 10);
  if (experimentFields)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[TRITrialExperimentFields mergeFrom:](experimentFields, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[TRITrialSystemTelemetry setExperimentFields:](self, "setExperimentFields:");
  }
  NSUInteger v4 = v25;
LABEL_11:
  rolloutFields = self->_rolloutFields;
  uint64_t v8 = *((void *)v4 + 20);
  if (rolloutFields)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[TRITrialRolloutFields mergeFrom:](rolloutFields, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    [(TRITrialSystemTelemetry *)self setRolloutFields:"setRolloutFields:"];
  }
  NSUInteger v4 = v25;
LABEL_17:
  if (*((void *)v4 + 3))
  {
    -[TRITrialSystemTelemetry setClientDeploymentEnv:](self, "setClientDeploymentEnv:");
    NSUInteger v4 = v25;
  }
  if (*((void *)v4 + 21))
  {
    -[TRITrialSystemTelemetry setTrialdTaskName:](self, "setTrialdTaskName:");
    NSUInteger v4 = v25;
  }
  if (*((void *)v4 + 18))
  {
    -[TRITrialSystemTelemetry setPrevOsBuild:](self, "setPrevOsBuild:");
    NSUInteger v4 = v25;
  }
  if (*((void *)v4 + 14))
  {
    -[TRITrialSystemTelemetry setPrevBcp47DeviceLocale:](self, "setPrevBcp47DeviceLocale:");
    NSUInteger v4 = v25;
  }
  if (*((void *)v4 + 17))
  {
    -[TRITrialSystemTelemetry setPrevLanguageCode:](self, "setPrevLanguageCode:");
    NSUInteger v4 = v25;
  }
  if (*((void *)v4 + 19))
  {
    -[TRITrialSystemTelemetry setPrevRegionCode:](self, "setPrevRegionCode:");
    NSUInteger v4 = v25;
  }
  if (*((void *)v4 + 4))
  {
    -[TRITrialSystemTelemetry setClientDeploymentId:](self, "setClientDeploymentId:");
    NSUInteger v4 = v25;
  }
  factorFields = self->_factorFields;
  uint64_t v10 = *((void *)v4 + 11);
  if (factorFields)
  {
    if (!v10) {
      goto LABEL_37;
    }
    -[TRITrialFactorFields mergeFrom:](factorFields, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_37;
    }
    -[TRITrialSystemTelemetry setFactorFields:](self, "setFactorFields:");
  }
  NSUInteger v4 = v25;
LABEL_37:
  downloadSettingsFields = self->_downloadSettingsFields;
  uint64_t v12 = *((void *)v4 + 8);
  if (downloadSettingsFields)
  {
    if (!v12) {
      goto LABEL_43;
    }
    -[TRITrialDownloadSettingsFields mergeFrom:](downloadSettingsFields, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_43;
    }
    -[TRITrialSystemTelemetry setDownloadSettingsFields:](self, "setDownloadSettingsFields:");
  }
  NSUInteger v4 = v25;
LABEL_43:
  containerOriginFields = self->_containerOriginFields;
  uint64_t v14 = *((void *)v4 + 7);
  if (containerOriginFields)
  {
    if (!v14) {
      goto LABEL_49;
    }
    -[TRITrialCloudKitContainerOriginFields mergeFrom:](containerOriginFields, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_49;
    }
    -[TRITrialSystemTelemetry setContainerOriginFields:](self, "setContainerOriginFields:");
  }
  NSUInteger v4 = v25;
LABEL_49:
  assetPurgeFields = self->_assetPurgeFields;
  uint64_t v16 = *((void *)v4 + 1);
  if (assetPurgeFields)
  {
    if (!v16) {
      goto LABEL_55;
    }
    -[TRITrialAssetPurgeFields mergeFrom:](assetPurgeFields, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_55;
    }
    -[TRITrialSystemTelemetry setAssetPurgeFields:](self, "setAssetPurgeFields:");
  }
  NSUInteger v4 = v25;
LABEL_55:
  downloadStatusFields = self->_downloadStatusFields;
  uint64_t v18 = *((void *)v4 + 9);
  if (downloadStatusFields)
  {
    if (!v18) {
      goto LABEL_61;
    }
    -[TRITrialDownloadStatusFields mergeFrom:](downloadStatusFields, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_61;
    }
    -[TRITrialSystemTelemetry setDownloadStatusFields:](self, "setDownloadStatusFields:");
  }
  NSUInteger v4 = v25;
LABEL_61:
  onDemandFactorFields = self->_onDemandFactorFields;
  uint64_t v20 = *((void *)v4 + 13);
  if (onDemandFactorFields)
  {
    if (!v20) {
      goto LABEL_67;
    }
    -[TRITrialOnDemandFactorFields mergeFrom:](onDemandFactorFields, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_67;
    }
    -[TRITrialSystemTelemetry setOnDemandFactorFields:](self, "setOnDemandFactorFields:");
  }
  NSUInteger v4 = v25;
LABEL_67:
  if (*((void *)v4 + 16))
  {
    -[TRITrialSystemTelemetry setPrevCarrierCountryIsoCode:](self, "setPrevCarrierCountryIsoCode:");
    NSUInteger v4 = v25;
  }
  if (*((void *)v4 + 15))
  {
    -[TRITrialSystemTelemetry setPrevCarrierBundleIdentifier:](self, "setPrevCarrierBundleIdentifier:");
    NSUInteger v4 = v25;
  }
  if (v4[180])
  {
    self->_prevExperimentOptOutStatus = v4[176];
    *(unsigned char *)&self->_has |= 1u;
  }
  mobileAssetOriginFields = self->_mobileAssetOriginFields;
  uint64_t v22 = *((void *)v4 + 12);
  if (mobileAssetOriginFields)
  {
    if (!v22) {
      goto LABEL_79;
    }
    -[TRITrialMobileAssetOriginFields mergeFrom:](mobileAssetOriginFields, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_79;
    }
    -[TRITrialSystemTelemetry setMobileAssetOriginFields:](self, "setMobileAssetOriginFields:");
  }
  NSUInteger v4 = v25;
LABEL_79:
  bmltFields = self->_bmltFields;
  uint64_t v24 = *((void *)v4 + 2);
  if (bmltFields)
  {
    if (v24) {
      -[TRITrialBMLTFields mergeFrom:](bmltFields, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[TRITrialSystemTelemetry setBmltFields:](self, "setBmltFields:");
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)clientTeamId
{
  return self->_clientTeamId;
}

- (void)setClientTeamId:(id)a3
{
}

- (NSString)clientProjectId
{
  return self->_clientProjectId;
}

- (void)setClientProjectId:(id)a3
{
}

- (TRITrialExperimentFields)experimentFields
{
  return self->_experimentFields;
}

- (void)setExperimentFields:(id)a3
{
}

- (TRITrialRolloutFields)rolloutFields
{
  return self->_rolloutFields;
}

- (void)setRolloutFields:(id)a3
{
}

- (NSString)clientDeploymentEnv
{
  return self->_clientDeploymentEnv;
}

- (void)setClientDeploymentEnv:(id)a3
{
}

- (NSString)trialdTaskName
{
  return self->_trialdTaskName;
}

- (void)setTrialdTaskName:(id)a3
{
}

- (NSString)prevOsBuild
{
  return self->_prevOsBuild;
}

- (void)setPrevOsBuild:(id)a3
{
}

- (NSString)prevBcp47DeviceLocale
{
  return self->_prevBcp47DeviceLocale;
}

- (void)setPrevBcp47DeviceLocale:(id)a3
{
}

- (NSString)prevLanguageCode
{
  return self->_prevLanguageCode;
}

- (void)setPrevLanguageCode:(id)a3
{
}

- (NSString)prevRegionCode
{
  return self->_prevRegionCode;
}

- (void)setPrevRegionCode:(id)a3
{
}

- (NSString)clientDeploymentId
{
  return self->_clientDeploymentId;
}

- (void)setClientDeploymentId:(id)a3
{
}

- (TRITrialFactorFields)factorFields
{
  return self->_factorFields;
}

- (void)setFactorFields:(id)a3
{
}

- (TRITrialDownloadSettingsFields)downloadSettingsFields
{
  return self->_downloadSettingsFields;
}

- (void)setDownloadSettingsFields:(id)a3
{
}

- (TRITrialCloudKitContainerOriginFields)containerOriginFields
{
  return self->_containerOriginFields;
}

- (void)setContainerOriginFields:(id)a3
{
}

- (TRITrialAssetPurgeFields)assetPurgeFields
{
  return self->_assetPurgeFields;
}

- (void)setAssetPurgeFields:(id)a3
{
}

- (TRITrialDownloadStatusFields)downloadStatusFields
{
  return self->_downloadStatusFields;
}

- (void)setDownloadStatusFields:(id)a3
{
}

- (TRITrialOnDemandFactorFields)onDemandFactorFields
{
  return self->_onDemandFactorFields;
}

- (void)setOnDemandFactorFields:(id)a3
{
}

- (NSString)prevCarrierCountryIsoCode
{
  return self->_prevCarrierCountryIsoCode;
}

- (void)setPrevCarrierCountryIsoCode:(id)a3
{
}

- (NSString)prevCarrierBundleIdentifier
{
  return self->_prevCarrierBundleIdentifier;
}

- (void)setPrevCarrierBundleIdentifier:(id)a3
{
}

- (BOOL)prevExperimentOptOutStatus
{
  return self->_prevExperimentOptOutStatus;
}

- (TRITrialMobileAssetOriginFields)mobileAssetOriginFields
{
  return self->_mobileAssetOriginFields;
}

- (void)setMobileAssetOriginFields:(id)a3
{
}

- (TRITrialBMLTFields)bmltFields
{
  return self->_bmltFields;
}

- (void)setBmltFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialdTaskName, 0);
  objc_storeStrong((id *)&self->_rolloutFields, 0);
  objc_storeStrong((id *)&self->_prevRegionCode, 0);
  objc_storeStrong((id *)&self->_prevOsBuild, 0);
  objc_storeStrong((id *)&self->_prevLanguageCode, 0);
  objc_storeStrong((id *)&self->_prevCarrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_prevCarrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_prevBcp47DeviceLocale, 0);
  objc_storeStrong((id *)&self->_onDemandFactorFields, 0);
  objc_storeStrong((id *)&self->_mobileAssetOriginFields, 0);
  objc_storeStrong((id *)&self->_factorFields, 0);
  objc_storeStrong((id *)&self->_experimentFields, 0);
  objc_storeStrong((id *)&self->_downloadStatusFields, 0);
  objc_storeStrong((id *)&self->_downloadSettingsFields, 0);
  objc_storeStrong((id *)&self->_containerOriginFields, 0);
  objc_storeStrong((id *)&self->_clientTeamId, 0);
  objc_storeStrong((id *)&self->_clientProjectId, 0);
  objc_storeStrong((id *)&self->_clientDeploymentId, 0);
  objc_storeStrong((id *)&self->_clientDeploymentEnv, 0);
  objc_storeStrong((id *)&self->_bmltFields, 0);
  objc_storeStrong((id *)&self->_assetPurgeFields, 0);
}

- (id)ensureExperimentFields
{
  NSUInteger v3 = [(TRITrialSystemTelemetry *)self experimentFields];
  if (!v3)
  {
    NSUInteger v3 = objc_opt_new();
    [(TRITrialSystemTelemetry *)self setExperimentFields:v3];
  }
  return v3;
}

- (id)ensureRolloutFields
{
  NSUInteger v3 = [(TRITrialSystemTelemetry *)self rolloutFields];
  if (!v3)
  {
    NSUInteger v3 = objc_opt_new();
    [(TRITrialSystemTelemetry *)self setRolloutFields:v3];
  }
  return v3;
}

- (id)ensureBMLTFields
{
  NSUInteger v3 = [(TRITrialSystemTelemetry *)self bmltFields];
  if (!v3)
  {
    NSUInteger v3 = objc_opt_new();
    [(TRITrialSystemTelemetry *)self setBmltFields:v3];
  }
  return v3;
}

- (id)ensureFactorFields
{
  NSUInteger v3 = [(TRITrialSystemTelemetry *)self factorFields];
  if (!v3)
  {
    NSUInteger v3 = objc_opt_new();
    [(TRITrialSystemTelemetry *)self setFactorFields:v3];
  }
  return v3;
}

- (id)ensureOnDemandFactorFields
{
  NSUInteger v3 = [(TRITrialSystemTelemetry *)self onDemandFactorFields];
  if (!v3)
  {
    NSUInteger v3 = objc_opt_new();
    [(TRITrialSystemTelemetry *)self setOnDemandFactorFields:v3];
  }
  return v3;
}

- (id)ensureAssetPurgeFields
{
  NSUInteger v3 = [(TRITrialSystemTelemetry *)self assetPurgeFields];
  if (!v3)
  {
    NSUInteger v3 = objc_opt_new();
    [(TRITrialSystemTelemetry *)self setAssetPurgeFields:v3];
  }
  return v3;
}

- (id)ensureMobileAssetOriginFields
{
  NSUInteger v3 = [(TRITrialSystemTelemetry *)self mobileAssetOriginFields];
  if (!v3)
  {
    NSUInteger v3 = objc_opt_new();
    [(TRITrialSystemTelemetry *)self setMobileAssetOriginFields:v3];
  }
  return v3;
}

- (void)setFieldsForDownloadOptions:(id)a3
{
  id v4 = a3;
  id v6 = [(TRITrialSystemTelemetry *)self downloadSettingsFields];
  if (!v6)
  {
    id v6 = (id)objc_opt_new();
    -[TRITrialSystemTelemetry setDownloadSettingsFields:](self, "setDownloadSettingsFields:");
  }
  objc_msgSend(v6, "setAllowAnyNetworking:", objc_msgSend(v4, "allowsCellularAccess"));
  unint64_t v5 = [v4 discretionaryBehavior];

  if (v5 <= 2) {
    [v6 setDiscretionaryBehavior:dword_19362C2B8[v5]];
  }
}

- (void)setFieldsForRolloutDeployment:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "deploymentId"));
  unint64_t v7 = [v6 stringValue];
  [(TRITrialSystemTelemetry *)self setClientDeploymentId:v7];

  id v9 = [(TRITrialSystemTelemetry *)self ensureRolloutFields];
  uint64_t v8 = [v5 rolloutId];

  [v9 setClientRolloutId:v8];
}

@end