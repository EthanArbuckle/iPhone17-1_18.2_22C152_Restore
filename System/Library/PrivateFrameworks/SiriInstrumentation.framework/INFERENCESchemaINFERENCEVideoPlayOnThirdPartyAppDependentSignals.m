@interface INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals
- (BOOL)hasEntityAbsoluteCount10Min;
- (BOOL)hasEntityAbsoluteCount14Day;
- (BOOL)hasEntityAbsoluteCount1Day;
- (BOOL)hasEntityAbsoluteCount1Hr;
- (BOOL)hasEntityAbsoluteCount28Day;
- (BOOL)hasEntityAbsoluteCount2Min;
- (BOOL)hasEntityAbsoluteCount6Hr;
- (BOOL)hasEntityAbsoluteCount7Day;
- (BOOL)hasEntityPartialAppCount10Min;
- (BOOL)hasEntityPartialAppCount1Day;
- (BOOL)hasEntityPartialAppCount1Hr;
- (BOOL)hasEntityPartialAppCount28Day;
- (BOOL)hasEntityPartialAppCount2Min;
- (BOOL)hasEntityPartialAppCount6Hr;
- (BOOL)hasEntityPartialAppCount7Day;
- (BOOL)hasEntityPartialSiriCount10Min;
- (BOOL)hasEntityPartialSiriCount1Day;
- (BOOL)hasEntityPartialSiriCount1Hr;
- (BOOL)hasEntityPartialSiriCount28Day;
- (BOOL)hasEntityPartialSiriCount2Min;
- (BOOL)hasEntityPartialSiriCount6Hr;
- (BOOL)hasEntityPartialSiriCount7Day;
- (BOOL)hasEntityRecency;
- (BOOL)hasIsForegroundApp;
- (BOOL)hasIsLastForegroundApp;
- (BOOL)hasIsLastNowPlayingApp;
- (BOOL)hasIsNowPlayingApp;
- (BOOL)hasIsSelectedApp;
- (BOOL)hasMediaUserContextNumberOfLibraryItems;
- (BOOL)hasMediaUserContextSubscriptionStatus;
- (BOOL)hasNowPlayingAbsoluteCount10Min;
- (BOOL)hasNowPlayingAbsoluteCount14Day;
- (BOOL)hasNowPlayingAbsoluteCount1Day;
- (BOOL)hasNowPlayingAbsoluteCount1Hr;
- (BOOL)hasNowPlayingAbsoluteCount28Day;
- (BOOL)hasNowPlayingAbsoluteCount2Min;
- (BOOL)hasNowPlayingAbsoluteCount6Hr;
- (BOOL)hasNowPlayingAbsoluteCount7Day;
- (BOOL)hasRelativeAppUsage14Day;
- (BOOL)hasRelativeAppUsage1Day;
- (BOOL)hasRelativeAppUsage7Day;
- (BOOL)hasSpotlightRelativeCount;
- (BOOL)hasSupportedMediaCategories;
- (BOOL)hasTimeSinceLastForegroundAppEndInSec;
- (BOOL)hasTimeSinceLastForegroundAppStartInSec;
- (BOOL)hasTimeSinceLastNowPlayingAppEndInSec;
- (BOOL)hasTimeSinceLastNowPlayingAppStartInSec;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForegroundApp;
- (BOOL)isLastForegroundApp;
- (BOOL)isLastNowPlayingApp;
- (BOOL)isNowPlayingApp;
- (BOOL)isSelectedApp;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)entityAbsoluteCount10Min;
- (int)entityAbsoluteCount14Day;
- (int)entityAbsoluteCount1Day;
- (int)entityAbsoluteCount1Hr;
- (int)entityAbsoluteCount28Day;
- (int)entityAbsoluteCount2Min;
- (int)entityAbsoluteCount6Hr;
- (int)entityAbsoluteCount7Day;
- (int)entityPartialAppCount10Min;
- (int)entityPartialAppCount1Day;
- (int)entityPartialAppCount1Hr;
- (int)entityPartialAppCount28Day;
- (int)entityPartialAppCount2Min;
- (int)entityPartialAppCount6Hr;
- (int)entityPartialAppCount7Day;
- (int)entityPartialSiriCount10Min;
- (int)entityPartialSiriCount1Day;
- (int)entityPartialSiriCount1Hr;
- (int)entityPartialSiriCount28Day;
- (int)entityPartialSiriCount2Min;
- (int)entityPartialSiriCount6Hr;
- (int)entityPartialSiriCount7Day;
- (int)entityRecency;
- (int)mediaUserContextNumberOfLibraryItems;
- (int)mediaUserContextSubscriptionStatus;
- (int)nowPlayingAbsoluteCount10Min;
- (int)nowPlayingAbsoluteCount14Day;
- (int)nowPlayingAbsoluteCount1Day;
- (int)nowPlayingAbsoluteCount1Hr;
- (int)nowPlayingAbsoluteCount28Day;
- (int)nowPlayingAbsoluteCount2Min;
- (int)nowPlayingAbsoluteCount6Hr;
- (int)nowPlayingAbsoluteCount7Day;
- (int)relativeAppUsage14Day;
- (int)relativeAppUsage1Day;
- (int)relativeAppUsage7Day;
- (int)spotlightRelativeCount;
- (int)timeSinceLastForegroundAppEndInSec;
- (int)timeSinceLastForegroundAppStartInSec;
- (int)timeSinceLastNowPlayingAppEndInSec;
- (int)timeSinceLastNowPlayingAppStartInSec;
- (unint64_t)hash;
- (unint64_t)supportedMediaCategories;
- (void)deleteEntityAbsoluteCount10Min;
- (void)deleteEntityAbsoluteCount14Day;
- (void)deleteEntityAbsoluteCount1Day;
- (void)deleteEntityAbsoluteCount1Hr;
- (void)deleteEntityAbsoluteCount28Day;
- (void)deleteEntityAbsoluteCount2Min;
- (void)deleteEntityAbsoluteCount6Hr;
- (void)deleteEntityAbsoluteCount7Day;
- (void)deleteEntityPartialAppCount10Min;
- (void)deleteEntityPartialAppCount1Day;
- (void)deleteEntityPartialAppCount1Hr;
- (void)deleteEntityPartialAppCount28Day;
- (void)deleteEntityPartialAppCount2Min;
- (void)deleteEntityPartialAppCount6Hr;
- (void)deleteEntityPartialAppCount7Day;
- (void)deleteEntityPartialSiriCount10Min;
- (void)deleteEntityPartialSiriCount1Day;
- (void)deleteEntityPartialSiriCount1Hr;
- (void)deleteEntityPartialSiriCount28Day;
- (void)deleteEntityPartialSiriCount2Min;
- (void)deleteEntityPartialSiriCount6Hr;
- (void)deleteEntityPartialSiriCount7Day;
- (void)deleteEntityRecency;
- (void)deleteIsForegroundApp;
- (void)deleteIsLastForegroundApp;
- (void)deleteIsLastNowPlayingApp;
- (void)deleteIsNowPlayingApp;
- (void)deleteIsSelectedApp;
- (void)deleteMediaUserContextNumberOfLibraryItems;
- (void)deleteMediaUserContextSubscriptionStatus;
- (void)deleteNowPlayingAbsoluteCount10Min;
- (void)deleteNowPlayingAbsoluteCount14Day;
- (void)deleteNowPlayingAbsoluteCount1Day;
- (void)deleteNowPlayingAbsoluteCount1Hr;
- (void)deleteNowPlayingAbsoluteCount28Day;
- (void)deleteNowPlayingAbsoluteCount2Min;
- (void)deleteNowPlayingAbsoluteCount6Hr;
- (void)deleteNowPlayingAbsoluteCount7Day;
- (void)deleteRelativeAppUsage14Day;
- (void)deleteRelativeAppUsage1Day;
- (void)deleteRelativeAppUsage7Day;
- (void)deleteSpotlightRelativeCount;
- (void)deleteSupportedMediaCategories;
- (void)deleteTimeSinceLastForegroundAppEndInSec;
- (void)deleteTimeSinceLastForegroundAppStartInSec;
- (void)deleteTimeSinceLastNowPlayingAppEndInSec;
- (void)deleteTimeSinceLastNowPlayingAppStartInSec;
- (void)setEntityAbsoluteCount10Min:(int)a3;
- (void)setEntityAbsoluteCount14Day:(int)a3;
- (void)setEntityAbsoluteCount1Day:(int)a3;
- (void)setEntityAbsoluteCount1Hr:(int)a3;
- (void)setEntityAbsoluteCount28Day:(int)a3;
- (void)setEntityAbsoluteCount2Min:(int)a3;
- (void)setEntityAbsoluteCount6Hr:(int)a3;
- (void)setEntityAbsoluteCount7Day:(int)a3;
- (void)setEntityPartialAppCount10Min:(int)a3;
- (void)setEntityPartialAppCount1Day:(int)a3;
- (void)setEntityPartialAppCount1Hr:(int)a3;
- (void)setEntityPartialAppCount28Day:(int)a3;
- (void)setEntityPartialAppCount2Min:(int)a3;
- (void)setEntityPartialAppCount6Hr:(int)a3;
- (void)setEntityPartialAppCount7Day:(int)a3;
- (void)setEntityPartialSiriCount10Min:(int)a3;
- (void)setEntityPartialSiriCount1Day:(int)a3;
- (void)setEntityPartialSiriCount1Hr:(int)a3;
- (void)setEntityPartialSiriCount28Day:(int)a3;
- (void)setEntityPartialSiriCount2Min:(int)a3;
- (void)setEntityPartialSiriCount6Hr:(int)a3;
- (void)setEntityPartialSiriCount7Day:(int)a3;
- (void)setEntityRecency:(int)a3;
- (void)setHasEntityAbsoluteCount10Min:(BOOL)a3;
- (void)setHasEntityAbsoluteCount14Day:(BOOL)a3;
- (void)setHasEntityAbsoluteCount1Day:(BOOL)a3;
- (void)setHasEntityAbsoluteCount1Hr:(BOOL)a3;
- (void)setHasEntityAbsoluteCount28Day:(BOOL)a3;
- (void)setHasEntityAbsoluteCount2Min:(BOOL)a3;
- (void)setHasEntityAbsoluteCount6Hr:(BOOL)a3;
- (void)setHasEntityAbsoluteCount7Day:(BOOL)a3;
- (void)setHasEntityPartialAppCount10Min:(BOOL)a3;
- (void)setHasEntityPartialAppCount1Day:(BOOL)a3;
- (void)setHasEntityPartialAppCount1Hr:(BOOL)a3;
- (void)setHasEntityPartialAppCount28Day:(BOOL)a3;
- (void)setHasEntityPartialAppCount2Min:(BOOL)a3;
- (void)setHasEntityPartialAppCount6Hr:(BOOL)a3;
- (void)setHasEntityPartialAppCount7Day:(BOOL)a3;
- (void)setHasEntityPartialSiriCount10Min:(BOOL)a3;
- (void)setHasEntityPartialSiriCount1Day:(BOOL)a3;
- (void)setHasEntityPartialSiriCount1Hr:(BOOL)a3;
- (void)setHasEntityPartialSiriCount28Day:(BOOL)a3;
- (void)setHasEntityPartialSiriCount2Min:(BOOL)a3;
- (void)setHasEntityPartialSiriCount6Hr:(BOOL)a3;
- (void)setHasEntityPartialSiriCount7Day:(BOOL)a3;
- (void)setHasEntityRecency:(BOOL)a3;
- (void)setHasIsForegroundApp:(BOOL)a3;
- (void)setHasIsLastForegroundApp:(BOOL)a3;
- (void)setHasIsLastNowPlayingApp:(BOOL)a3;
- (void)setHasIsNowPlayingApp:(BOOL)a3;
- (void)setHasIsSelectedApp:(BOOL)a3;
- (void)setHasMediaUserContextNumberOfLibraryItems:(BOOL)a3;
- (void)setHasMediaUserContextSubscriptionStatus:(BOOL)a3;
- (void)setHasNowPlayingAbsoluteCount10Min:(BOOL)a3;
- (void)setHasNowPlayingAbsoluteCount14Day:(BOOL)a3;
- (void)setHasNowPlayingAbsoluteCount1Day:(BOOL)a3;
- (void)setHasNowPlayingAbsoluteCount1Hr:(BOOL)a3;
- (void)setHasNowPlayingAbsoluteCount28Day:(BOOL)a3;
- (void)setHasNowPlayingAbsoluteCount2Min:(BOOL)a3;
- (void)setHasNowPlayingAbsoluteCount6Hr:(BOOL)a3;
- (void)setHasNowPlayingAbsoluteCount7Day:(BOOL)a3;
- (void)setHasRelativeAppUsage14Day:(BOOL)a3;
- (void)setHasRelativeAppUsage1Day:(BOOL)a3;
- (void)setHasRelativeAppUsage7Day:(BOOL)a3;
- (void)setHasSpotlightRelativeCount:(BOOL)a3;
- (void)setHasSupportedMediaCategories:(BOOL)a3;
- (void)setHasTimeSinceLastForegroundAppEndInSec:(BOOL)a3;
- (void)setHasTimeSinceLastForegroundAppStartInSec:(BOOL)a3;
- (void)setHasTimeSinceLastNowPlayingAppEndInSec:(BOOL)a3;
- (void)setHasTimeSinceLastNowPlayingAppStartInSec:(BOOL)a3;
- (void)setIsForegroundApp:(BOOL)a3;
- (void)setIsLastForegroundApp:(BOOL)a3;
- (void)setIsLastNowPlayingApp:(BOOL)a3;
- (void)setIsNowPlayingApp:(BOOL)a3;
- (void)setIsSelectedApp:(BOOL)a3;
- (void)setMediaUserContextNumberOfLibraryItems:(int)a3;
- (void)setMediaUserContextSubscriptionStatus:(int)a3;
- (void)setNowPlayingAbsoluteCount10Min:(int)a3;
- (void)setNowPlayingAbsoluteCount14Day:(int)a3;
- (void)setNowPlayingAbsoluteCount1Day:(int)a3;
- (void)setNowPlayingAbsoluteCount1Hr:(int)a3;
- (void)setNowPlayingAbsoluteCount28Day:(int)a3;
- (void)setNowPlayingAbsoluteCount2Min:(int)a3;
- (void)setNowPlayingAbsoluteCount6Hr:(int)a3;
- (void)setNowPlayingAbsoluteCount7Day:(int)a3;
- (void)setRelativeAppUsage14Day:(int)a3;
- (void)setRelativeAppUsage1Day:(int)a3;
- (void)setRelativeAppUsage7Day:(int)a3;
- (void)setSpotlightRelativeCount:(int)a3;
- (void)setSupportedMediaCategories:(unint64_t)a3;
- (void)setTimeSinceLastForegroundAppEndInSec:(int)a3;
- (void)setTimeSinceLastForegroundAppStartInSec:(int)a3;
- (void)setTimeSinceLastNowPlayingAppEndInSec:(int)a3;
- (void)setTimeSinceLastNowPlayingAppStartInSec:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)entityPartialAppCount28Day
{
  return self->_entityPartialAppCount28Day;
}

- (int)entityPartialAppCount7Day
{
  return self->_entityPartialAppCount7Day;
}

- (int)entityPartialAppCount1Day
{
  return self->_entityPartialAppCount1Day;
}

- (int)entityPartialAppCount6Hr
{
  return self->_entityPartialAppCount6Hr;
}

- (int)entityPartialAppCount1Hr
{
  return self->_entityPartialAppCount1Hr;
}

- (int)entityPartialAppCount10Min
{
  return self->_entityPartialAppCount10Min;
}

- (int)entityPartialAppCount2Min
{
  return self->_entityPartialAppCount2Min;
}

- (int)entityPartialSiriCount28Day
{
  return self->_entityPartialSiriCount28Day;
}

- (int)entityPartialSiriCount7Day
{
  return self->_entityPartialSiriCount7Day;
}

- (int)entityPartialSiriCount1Day
{
  return self->_entityPartialSiriCount1Day;
}

- (int)entityPartialSiriCount6Hr
{
  return self->_entityPartialSiriCount6Hr;
}

- (int)entityPartialSiriCount1Hr
{
  return self->_entityPartialSiriCount1Hr;
}

- (int)entityPartialSiriCount10Min
{
  return self->_entityPartialSiriCount10Min;
}

- (int)entityPartialSiriCount2Min
{
  return self->_entityPartialSiriCount2Min;
}

- (BOOL)isForegroundApp
{
  return self->_isForegroundApp;
}

- (unint64_t)supportedMediaCategories
{
  return self->_supportedMediaCategories;
}

- (int)spotlightRelativeCount
{
  return self->_spotlightRelativeCount;
}

- (int)timeSinceLastNowPlayingAppEndInSec
{
  return self->_timeSinceLastNowPlayingAppEndInSec;
}

- (int)timeSinceLastNowPlayingAppStartInSec
{
  return self->_timeSinceLastNowPlayingAppStartInSec;
}

- (int)timeSinceLastForegroundAppEndInSec
{
  return self->_timeSinceLastForegroundAppEndInSec;
}

- (int)timeSinceLastForegroundAppStartInSec
{
  return self->_timeSinceLastForegroundAppStartInSec;
}

- (BOOL)isSelectedApp
{
  return self->_isSelectedApp;
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (int)nowPlayingAbsoluteCount28Day
{
  return self->_nowPlayingAbsoluteCount28Day;
}

- (int)nowPlayingAbsoluteCount14Day
{
  return self->_nowPlayingAbsoluteCount14Day;
}

- (int)nowPlayingAbsoluteCount7Day
{
  return self->_nowPlayingAbsoluteCount7Day;
}

- (int)nowPlayingAbsoluteCount1Day
{
  return self->_nowPlayingAbsoluteCount1Day;
}

- (int)nowPlayingAbsoluteCount6Hr
{
  return self->_nowPlayingAbsoluteCount6Hr;
}

- (int)nowPlayingAbsoluteCount1Hr
{
  return self->_nowPlayingAbsoluteCount1Hr;
}

- (int)nowPlayingAbsoluteCount10Min
{
  return self->_nowPlayingAbsoluteCount10Min;
}

- (int)nowPlayingAbsoluteCount2Min
{
  return self->_nowPlayingAbsoluteCount2Min;
}

- (BOOL)isLastNowPlayingApp
{
  return self->_isLastNowPlayingApp;
}

- (BOOL)isLastForegroundApp
{
  return self->_isLastForegroundApp;
}

- (int)mediaUserContextSubscriptionStatus
{
  return self->_mediaUserContextSubscriptionStatus;
}

- (int)mediaUserContextNumberOfLibraryItems
{
  return self->_mediaUserContextNumberOfLibraryItems;
}

- (int)entityRecency
{
  return self->_entityRecency;
}

- (int)entityAbsoluteCount28Day
{
  return self->_entityAbsoluteCount28Day;
}

- (int)entityAbsoluteCount14Day
{
  return self->_entityAbsoluteCount14Day;
}

- (int)entityAbsoluteCount7Day
{
  return self->_entityAbsoluteCount7Day;
}

- (int)entityAbsoluteCount1Day
{
  return self->_entityAbsoluteCount1Day;
}

- (int)entityAbsoluteCount6Hr
{
  return self->_entityAbsoluteCount6Hr;
}

- (int)entityAbsoluteCount1Hr
{
  return self->_entityAbsoluteCount1Hr;
}

- (int)entityAbsoluteCount10Min
{
  return self->_entityAbsoluteCount10Min;
}

- (int)entityAbsoluteCount2Min
{
  return self->_entityAbsoluteCount2Min;
}

- (int)relativeAppUsage14Day
{
  return self->_relativeAppUsage14Day;
}

- (int)relativeAppUsage7Day
{
  return self->_relativeAppUsage7Day;
}

- (int)relativeAppUsage1Day
{
  return self->_relativeAppUsage1Day;
}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v102.receiver = self;
  v102.super_class = (Class)INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals;
  v5 = [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)&v102 init];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"relativeAppUsage1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage1Day:](v5, "setRelativeAppUsage1Day:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"relativeAppUsage7Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage7Day:](v5, "setRelativeAppUsage7Day:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"relativeAppUsage14Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setRelativeAppUsage14Day:](v5, "setRelativeAppUsage14Day:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"entityAbsoluteCount2Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount2Min:](v5, "setEntityAbsoluteCount2Min:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"entityAbsoluteCount10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount10Min:](v5, "setEntityAbsoluteCount10Min:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"entityAbsoluteCount1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount1Hr:](v5, "setEntityAbsoluteCount1Hr:", [v11 intValue]);
    }
    v82 = v6;
    v12 = [v4 objectForKeyedSubscript:@"entityAbsoluteCount6Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount6Hr:](v5, "setEntityAbsoluteCount6Hr:", [v12 intValue]);
    }
    v76 = v12;
    v13 = [v4 objectForKeyedSubscript:@"entityAbsoluteCount1Day"];
    objc_opt_class();
    v101 = v13;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount1Day:](v5, "setEntityAbsoluteCount1Day:", [v13 intValue]);
    }
    v81 = v7;
    v14 = [v4 objectForKeyedSubscript:@"entityAbsoluteCount7Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount7Day:](v5, "setEntityAbsoluteCount7Day:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"entityAbsoluteCount14Day"];
    objc_opt_class();
    v100 = v15;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount14Day:](v5, "setEntityAbsoluteCount14Day:", [v15 intValue]);
    }
    v80 = v8;
    v16 = [v4 objectForKeyedSubscript:@"entityAbsoluteCount28Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityAbsoluteCount28Day:](v5, "setEntityAbsoluteCount28Day:", [v16 intValue]);
    }
    v17 = v10;
    v18 = [v4 objectForKeyedSubscript:@"entityRecency"];
    objc_opt_class();
    v99 = v18;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityRecency:](v5, "setEntityRecency:", [v18 intValue]);
    }
    v19 = v9;
    v20 = [v4 objectForKeyedSubscript:@"mediaUserContextNumberOfLibraryItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setMediaUserContextNumberOfLibraryItems:](v5, "setMediaUserContextNumberOfLibraryItems:", [v20 intValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"mediaUserContextSubscriptionStatus"];
    objc_opt_class();
    v98 = v21;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setMediaUserContextSubscriptionStatus:](v5, "setMediaUserContextSubscriptionStatus:", [v21 intValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"isLastForegroundApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsLastForegroundApp:](v5, "setIsLastForegroundApp:", [v22 BOOLValue]);
    }
    v72 = v22;
    v23 = [v4 objectForKeyedSubscript:@"isLastNowPlayingApp"];
    objc_opt_class();
    v97 = v23;
    v79 = v19;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsLastNowPlayingApp:](v5, "setIsLastNowPlayingApp:", [v23 BOOLValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"nowPlayingAbsoluteCount2Min"];
    objc_opt_class();
    v96 = v24;
    v78 = v17;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount2Min:](v5, "setNowPlayingAbsoluteCount2Min:", [v24 intValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"nowPlayingAbsoluteCount10Min"];
    objc_opt_class();
    v95 = v25;
    v77 = v11;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount10Min:](v5, "setNowPlayingAbsoluteCount10Min:", [v25 intValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"nowPlayingAbsoluteCount1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount1Hr:](v5, "setNowPlayingAbsoluteCount1Hr:", [v26 intValue]);
    }
    v71 = v26;
    v27 = [v4 objectForKeyedSubscript:@"nowPlayingAbsoluteCount6Hr"];
    objc_opt_class();
    v94 = v27;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount6Hr:](v5, "setNowPlayingAbsoluteCount6Hr:", [v27 intValue]);
    }
    v28 = [v4 objectForKeyedSubscript:@"nowPlayingAbsoluteCount1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount1Day:](v5, "setNowPlayingAbsoluteCount1Day:", [v28 intValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"nowPlayingAbsoluteCount7Day"];
    objc_opt_class();
    v93 = v29;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount7Day:](v5, "setNowPlayingAbsoluteCount7Day:", [v29 intValue]);
    }
    v30 = v20;
    v31 = [v4 objectForKeyedSubscript:@"nowPlayingAbsoluteCount14Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount14Day:](v5, "setNowPlayingAbsoluteCount14Day:", [v31 intValue]);
    }
    v69 = v31;
    v32 = v16;
    v33 = [v4 objectForKeyedSubscript:@"nowPlayingAbsoluteCount28Day"];
    objc_opt_class();
    v92 = v33;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setNowPlayingAbsoluteCount28Day:](v5, "setNowPlayingAbsoluteCount28Day:", [v33 intValue]);
    }
    v34 = v14;
    v35 = [v4 objectForKeyedSubscript:@"isNowPlayingApp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsNowPlayingApp:](v5, "setIsNowPlayingApp:", [v35 BOOLValue]);
    }
    v36 = [v4 objectForKeyedSubscript:@"isSelectedApp"];
    objc_opt_class();
    v91 = v36;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsSelectedApp:](v5, "setIsSelectedApp:", [v36 BOOLValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"timeSinceLastForegroundAppStartInSec"];
    objc_opt_class();
    v90 = v37;
    v75 = v34;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastForegroundAppStartInSec:](v5, "setTimeSinceLastForegroundAppStartInSec:", [v37 intValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"timeSinceLastForegroundAppEndInSec"];
    objc_opt_class();
    v89 = v38;
    v74 = v32;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastForegroundAppEndInSec:](v5, "setTimeSinceLastForegroundAppEndInSec:", [v38 intValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"timeSinceLastNowPlayingAppStartInSec"];
    objc_opt_class();
    v88 = v39;
    v73 = v30;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastNowPlayingAppStartInSec:](v5, "setTimeSinceLastNowPlayingAppStartInSec:", [v39 intValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"timeSinceLastNowPlayingAppEndInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setTimeSinceLastNowPlayingAppEndInSec:](v5, "setTimeSinceLastNowPlayingAppEndInSec:", [v40 intValue]);
    }
    v41 = [v4 objectForKeyedSubscript:@"spotlightRelativeCount"];
    objc_opt_class();
    v87 = v41;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setSpotlightRelativeCount:](v5, "setSpotlightRelativeCount:", [v41 intValue]);
    }
    v42 = [v4 objectForKeyedSubscript:@"supportedMediaCategories"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setSupportedMediaCategories:](v5, "setSupportedMediaCategories:", [v42 unsignedLongLongValue]);
    }
    v43 = [v4 objectForKeyedSubscript:@"isForegroundApp"];
    objc_opt_class();
    v86 = v43;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setIsForegroundApp:](v5, "setIsForegroundApp:", [v43 BOOLValue]);
    }
    v44 = [v4 objectForKeyedSubscript:@"entityPartialSiriCount2Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount2Min:](v5, "setEntityPartialSiriCount2Min:", [v44 intValue]);
    }
    v45 = [v4 objectForKeyedSubscript:@"entityPartialSiriCount10Min"];
    objc_opt_class();
    v85 = v45;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount10Min:](v5, "setEntityPartialSiriCount10Min:", [v45 intValue]);
    }
    v46 = v28;
    v47 = [v4 objectForKeyedSubscript:@"entityPartialSiriCount1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount1Hr:](v5, "setEntityPartialSiriCount1Hr:", [v47 intValue]);
    }
    v48 = [v4 objectForKeyedSubscript:@"entityPartialSiriCount6Hr"];
    objc_opt_class();
    v84 = v48;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount6Hr:](v5, "setEntityPartialSiriCount6Hr:", [v48 intValue]);
    }
    uint64_t v49 = [v4 objectForKeyedSubscript:@"entityPartialSiriCount1Day"];
    objc_opt_class();
    v83 = (void *)v49;
    v50 = v46;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount1Day:](v5, "setEntityPartialSiriCount1Day:", [v83 intValue]);
    }
    v51 = [v4 objectForKeyedSubscript:@"entityPartialSiriCount7Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount7Day:](v5, "setEntityPartialSiriCount7Day:", [v51 intValue]);
    }
    v66 = v42;
    v52 = [v4 objectForKeyedSubscript:@"entityPartialSiriCount28Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialSiriCount28Day:](v5, "setEntityPartialSiriCount28Day:", [v52 intValue]);
    }
    v62 = v52;
    v65 = v44;
    v53 = [v4 objectForKeyedSubscript:@"entityPartialAppCount2Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount2Min:](v5, "setEntityPartialAppCount2Min:", [v53 intValue]);
    }
    v64 = v47;
    v54 = [v4 objectForKeyedSubscript:@"entityPartialAppCount10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount10Min:](v5, "setEntityPartialAppCount10Min:", [v54 intValue]);
    }
    v70 = v50;
    v55 = [v4 objectForKeyedSubscript:@"entityPartialAppCount1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount1Hr:](v5, "setEntityPartialAppCount1Hr:", [v55 intValue]);
    }
    v63 = v51;
    v56 = [v4 objectForKeyedSubscript:@"entityPartialAppCount6Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount6Hr:](v5, "setEntityPartialAppCount6Hr:", [v56 intValue]);
    }
    v68 = v35;
    v57 = [v4 objectForKeyedSubscript:@"entityPartialAppCount1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount1Day:](v5, "setEntityPartialAppCount1Day:", [v57 intValue]);
    }
    v67 = v40;
    v58 = [v4 objectForKeyedSubscript:@"entityPartialAppCount7Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount7Day:](v5, "setEntityPartialAppCount7Day:", [v58 intValue]);
    }
    v59 = [v4 objectForKeyedSubscript:@"entityPartialAppCount28Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals setEntityPartialAppCount28Day:](v5, "setEntityPartialAppCount28Day:", [v59 intValue]);
    }
    v60 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self dictionaryRepresentation];
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
  $36A3CCAAE4681EBA138F0132699ACCCC v4 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v5 = *(void *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount10Min](self, "entityAbsoluteCount10Min"));
    [v3 setObject:v9 forKeyedSubscript:@"entityAbsoluteCount10Min"];

    $36A3CCAAE4681EBA138F0132699ACCCC v10 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v5 = *(void *)&v10 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    if ((*(_WORD *)&v10 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&v4 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount14Day](self, "entityAbsoluteCount14Day"));
  [v3 setObject:v11 forKeyedSubscript:@"entityAbsoluteCount14Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_53;
  }
LABEL_52:
  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount1Day](self, "entityAbsoluteCount1Day"));
  [v3 setObject:v12 forKeyedSubscript:@"entityAbsoluteCount1Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_54;
  }
LABEL_53:
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount1Hr](self, "entityAbsoluteCount1Hr"));
  [v3 setObject:v13 forKeyedSubscript:@"entityAbsoluteCount1Hr"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_55;
  }
LABEL_54:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount28Day](self, "entityAbsoluteCount28Day"));
  [v3 setObject:v14 forKeyedSubscript:@"entityAbsoluteCount28Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_56;
  }
LABEL_55:
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount2Min](self, "entityAbsoluteCount2Min"));
  [v3 setObject:v15 forKeyedSubscript:@"entityAbsoluteCount2Min"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_57;
  }
LABEL_56:
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount6Hr](self, "entityAbsoluteCount6Hr"));
  [v3 setObject:v16 forKeyedSubscript:@"entityAbsoluteCount6Hr"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_58;
  }
LABEL_57:
  v17 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityAbsoluteCount7Day](self, "entityAbsoluteCount7Day"));
  [v3 setObject:v17 forKeyedSubscript:@"entityAbsoluteCount7Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x100000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_59;
  }
LABEL_58:
  v18 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount10Min](self, "entityPartialAppCount10Min"));
  [v3 setObject:v18 forKeyedSubscript:@"entityPartialAppCount10Min"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_60;
  }
LABEL_59:
  v19 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount1Day](self, "entityPartialAppCount1Day"));
  [v3 setObject:v19 forKeyedSubscript:@"entityPartialAppCount1Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x400000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_61;
  }
LABEL_60:
  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount1Hr](self, "entityPartialAppCount1Hr"));
  [v3 setObject:v20 forKeyedSubscript:@"entityPartialAppCount1Hr"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x400000000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_62;
  }
LABEL_61:
  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount28Day](self, "entityPartialAppCount28Day"));
  [v3 setObject:v21 forKeyedSubscript:@"entityPartialAppCount28Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_63;
  }
LABEL_62:
  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount2Min](self, "entityPartialAppCount2Min"));
  [v3 setObject:v22 forKeyedSubscript:@"entityPartialAppCount2Min"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x200000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_64;
  }
LABEL_63:
  v23 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount6Hr](self, "entityPartialAppCount6Hr"));
  [v3 setObject:v23 forKeyedSubscript:@"entityPartialAppCount6Hr"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_65;
  }
LABEL_64:
  v24 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialAppCount7Day](self, "entityPartialAppCount7Day"));
  [v3 setObject:v24 forKeyedSubscript:@"entityPartialAppCount7Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_66;
  }
LABEL_65:
  v25 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount10Min](self, "entityPartialSiriCount10Min"));
  [v3 setObject:v25 forKeyedSubscript:@"entityPartialSiriCount10Min"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_67;
  }
LABEL_66:
  v26 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount1Day](self, "entityPartialSiriCount1Day"));
  [v3 setObject:v26 forKeyedSubscript:@"entityPartialSiriCount1Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_68;
  }
LABEL_67:
  v27 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount1Hr](self, "entityPartialSiriCount1Hr"));
  [v3 setObject:v27 forKeyedSubscript:@"entityPartialSiriCount1Hr"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_69;
  }
LABEL_68:
  v28 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount28Day](self, "entityPartialSiriCount28Day"));
  [v3 setObject:v28 forKeyedSubscript:@"entityPartialSiriCount28Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_70;
  }
LABEL_69:
  v29 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount2Min](self, "entityPartialSiriCount2Min"));
  [v3 setObject:v29 forKeyedSubscript:@"entityPartialSiriCount2Min"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_71;
  }
LABEL_70:
  v30 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount6Hr](self, "entityPartialSiriCount6Hr"));
  [v3 setObject:v30 forKeyedSubscript:@"entityPartialSiriCount6Hr"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_72;
  }
LABEL_71:
  v31 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityPartialSiriCount7Day](self, "entityPartialSiriCount7Day"));
  [v3 setObject:v31 forKeyedSubscript:@"entityPartialSiriCount7Day"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_24:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_73;
  }
LABEL_72:
  v32 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals entityRecency](self, "entityRecency"));
  [v3 setObject:v32 forKeyedSubscript:@"entityRecency"];

  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_74;
  }
LABEL_73:
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isForegroundApp](self, "isForegroundApp"));
  [v3 setObject:v33 forKeyedSubscript:@"isForegroundApp"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x4000) == 0)
  {
LABEL_26:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_75;
  }
LABEL_74:
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isLastForegroundApp](self, "isLastForegroundApp"));
  [v3 setObject:v34 forKeyedSubscript:@"isLastForegroundApp"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x8000) == 0)
  {
LABEL_27:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_76;
  }
LABEL_75:
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isLastNowPlayingApp](self, "isLastNowPlayingApp"));
  [v3 setObject:v35 forKeyedSubscript:@"isLastNowPlayingApp"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x1000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_77;
  }
LABEL_76:
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isNowPlayingApp](self, "isNowPlayingApp"));
  [v3 setObject:v36 forKeyedSubscript:@"isNowPlayingApp"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x2000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_78;
  }
LABEL_77:
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals isSelectedApp](self, "isSelectedApp"));
  [v3 setObject:v37 forKeyedSubscript:@"isSelectedApp"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x1000) == 0)
  {
LABEL_30:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_79;
  }
LABEL_78:
  v38 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals mediaUserContextNumberOfLibraryItems](self, "mediaUserContextNumberOfLibraryItems"));
  [v3 setObject:v38 forKeyedSubscript:@"mediaUserContextNumberOfLibraryItems"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x2000) == 0)
  {
LABEL_31:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_80;
  }
LABEL_79:
  v39 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals mediaUserContextSubscriptionStatus](self, "mediaUserContextSubscriptionStatus"));
  [v3 setObject:v39 forKeyedSubscript:@"mediaUserContextSubscriptionStatus"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x20000) == 0)
  {
LABEL_32:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_81;
  }
LABEL_80:
  v40 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount10Min](self, "nowPlayingAbsoluteCount10Min"));
  [v3 setObject:v40 forKeyedSubscript:@"nowPlayingAbsoluteCount10Min"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x400000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_82;
  }
LABEL_81:
  v41 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount14Day](self, "nowPlayingAbsoluteCount14Day"));
  [v3 setObject:v41 forKeyedSubscript:@"nowPlayingAbsoluteCount14Day"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x100000) == 0)
  {
LABEL_34:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_83;
  }
LABEL_82:
  v42 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount1Day](self, "nowPlayingAbsoluteCount1Day"));
  [v3 setObject:v42 forKeyedSubscript:@"nowPlayingAbsoluteCount1Day"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x40000) == 0)
  {
LABEL_35:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_84;
  }
LABEL_83:
  v43 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount1Hr](self, "nowPlayingAbsoluteCount1Hr"));
  [v3 setObject:v43 forKeyedSubscript:@"nowPlayingAbsoluteCount1Hr"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x800000) == 0)
  {
LABEL_36:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_85;
  }
LABEL_84:
  v44 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount28Day](self, "nowPlayingAbsoluteCount28Day"));
  [v3 setObject:v44 forKeyedSubscript:@"nowPlayingAbsoluteCount28Day"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x10000) == 0)
  {
LABEL_37:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_86;
  }
LABEL_85:
  v45 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount2Min](self, "nowPlayingAbsoluteCount2Min"));
  [v3 setObject:v45 forKeyedSubscript:@"nowPlayingAbsoluteCount2Min"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x80000) == 0)
  {
LABEL_38:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_87;
  }
LABEL_86:
  v46 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount6Hr](self, "nowPlayingAbsoluteCount6Hr"));
  [v3 setObject:v46 forKeyedSubscript:@"nowPlayingAbsoluteCount6Hr"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x200000) == 0)
  {
LABEL_39:
    if ((v5 & 4) == 0) {
      goto LABEL_40;
    }
    goto LABEL_88;
  }
LABEL_87:
  v47 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals nowPlayingAbsoluteCount7Day](self, "nowPlayingAbsoluteCount7Day"));
  [v3 setObject:v47 forKeyedSubscript:@"nowPlayingAbsoluteCount7Day"];

  LODWORD(v5) = self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_40:
    if ((v5 & 1) == 0) {
      goto LABEL_41;
    }
    goto LABEL_89;
  }
LABEL_88:
  v48 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals relativeAppUsage14Day](self, "relativeAppUsage14Day"));
  [v3 setObject:v48 forKeyedSubscript:@"relativeAppUsage14Day"];

  LODWORD(v5) = self->_has;
  if ((v5 & 1) == 0)
  {
LABEL_41:
    if ((v5 & 2) == 0) {
      goto LABEL_42;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v49 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals relativeAppUsage1Day](self, "relativeAppUsage1Day"));
  [v3 setObject:v49 forKeyedSubscript:@"relativeAppUsage1Day"];

  LODWORD(v5) = self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_42:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_91;
  }
LABEL_90:
  v50 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals relativeAppUsage7Day](self, "relativeAppUsage7Day"));
  [v3 setObject:v50 forKeyedSubscript:@"relativeAppUsage7Day"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x40000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_92;
  }
LABEL_91:
  v51 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals spotlightRelativeCount](self, "spotlightRelativeCount"));
  [v3 setObject:v51 forKeyedSubscript:@"spotlightRelativeCount"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x80000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_93;
  }
LABEL_92:
  v52 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals supportedMediaCategories](self, "supportedMediaCategories"));
  [v3 setObject:v52 forKeyedSubscript:@"supportedMediaCategories"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x8000000) == 0)
  {
LABEL_45:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_94;
  }
LABEL_93:
  v53 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals timeSinceLastForegroundAppEndInSec](self, "timeSinceLastForegroundAppEndInSec"));
  [v3 setObject:v53 forKeyedSubscript:@"timeSinceLastForegroundAppEndInSec"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x4000000) == 0)
  {
LABEL_46:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_47;
    }
LABEL_95:
    v55 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals timeSinceLastNowPlayingAppEndInSec](self, "timeSinceLastNowPlayingAppEndInSec"));
    [v3 setObject:v55 forKeyedSubscript:@"timeSinceLastNowPlayingAppEndInSec"];

    if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_94:
  v54 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals timeSinceLastForegroundAppStartInSec](self, "timeSinceLastForegroundAppStartInSec"));
  [v3 setObject:v54 forKeyedSubscript:@"timeSinceLastForegroundAppStartInSec"];

  LODWORD(v5) = self->_has;
  if ((v5 & 0x20000000) != 0) {
    goto LABEL_95;
  }
LABEL_47:
  if ((v5 & 0x10000000) != 0)
  {
LABEL_48:
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals timeSinceLastNowPlayingAppStartInSec](self, "timeSinceLastNowPlayingAppStartInSec"));
    [v3 setObject:v6 forKeyedSubscript:@"timeSinceLastNowPlayingAppStartInSec"];
  }
LABEL_49:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  id v7 = v3;

  return v7;
}

- (unint64_t)hash
{
  $36A3CCAAE4681EBA138F0132699ACCCC v2 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v3 = *(void *)&v2 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if (*(unsigned char *)&v2)
  {
    uint64_t v51 = 2654435761 * self->_relativeAppUsage1Day;
    if ((*(unsigned char *)&v2 & 2) != 0)
    {
LABEL_3:
      uint64_t v50 = 2654435761 * self->_relativeAppUsage7Day;
      if ((*(unsigned char *)&v2 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v51 = 0;
    if ((*(unsigned char *)&v2 & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v50 = 0;
  if ((*(unsigned char *)&v2 & 4) != 0)
  {
LABEL_4:
    uint64_t v49 = 2654435761 * self->_relativeAppUsage14Day;
    if ((*(unsigned char *)&v2 & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v49 = 0;
  if ((*(unsigned char *)&v2 & 8) != 0)
  {
LABEL_5:
    uint64_t v48 = 2654435761 * self->_entityAbsoluteCount2Min;
    if ((*(unsigned char *)&v2 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v48 = 0;
  if ((*(unsigned char *)&v2 & 0x10) != 0)
  {
LABEL_6:
    uint64_t v47 = 2654435761 * self->_entityAbsoluteCount10Min;
    if ((*(unsigned char *)&v2 & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v47 = 0;
  if ((*(unsigned char *)&v2 & 0x20) != 0)
  {
LABEL_7:
    uint64_t v46 = 2654435761 * self->_entityAbsoluteCount1Hr;
    if ((*(unsigned char *)&v2 & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v46 = 0;
  if ((*(unsigned char *)&v2 & 0x40) != 0)
  {
LABEL_8:
    uint64_t v45 = 2654435761 * self->_entityAbsoluteCount6Hr;
    if ((*(unsigned char *)&v2 & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v45 = 0;
  if ((*(unsigned char *)&v2 & 0x80) != 0)
  {
LABEL_9:
    uint64_t v44 = 2654435761 * self->_entityAbsoluteCount1Day;
    if ((*(_WORD *)&v2 & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v44 = 0;
  if ((*(_WORD *)&v2 & 0x100) != 0)
  {
LABEL_10:
    uint64_t v43 = 2654435761 * self->_entityAbsoluteCount7Day;
    if ((*(_WORD *)&v2 & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v43 = 0;
  if ((*(_WORD *)&v2 & 0x200) != 0)
  {
LABEL_11:
    uint64_t v42 = 2654435761 * self->_entityAbsoluteCount14Day;
    if ((*(_WORD *)&v2 & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v42 = 0;
  if ((*(_WORD *)&v2 & 0x400) != 0)
  {
LABEL_12:
    uint64_t v41 = 2654435761 * self->_entityAbsoluteCount28Day;
    if ((*(_WORD *)&v2 & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v41 = 0;
  if ((*(_WORD *)&v2 & 0x800) != 0)
  {
LABEL_13:
    uint64_t v40 = 2654435761 * self->_entityRecency;
    if ((*(_WORD *)&v2 & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v40 = 0;
  if ((*(_WORD *)&v2 & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v39 = 2654435761 * self->_mediaUserContextNumberOfLibraryItems;
    if ((*(_WORD *)&v2 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v39 = 0;
  if ((*(_WORD *)&v2 & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v38 = 2654435761 * self->_mediaUserContextSubscriptionStatus;
    if ((*(_WORD *)&v2 & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v38 = 0;
  if ((*(_WORD *)&v2 & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v37 = 2654435761 * self->_isLastForegroundApp;
    if ((*(_WORD *)&v2 & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v37 = 0;
  if ((*(_WORD *)&v2 & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v36 = 2654435761 * self->_isLastNowPlayingApp;
    if ((*(_DWORD *)&v2 & 0x10000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&v2 & 0x10000) != 0)
  {
LABEL_18:
    uint64_t v35 = 2654435761 * self->_nowPlayingAbsoluteCount2Min;
    if ((*(_DWORD *)&v2 & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&v2 & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v34 = 2654435761 * self->_nowPlayingAbsoluteCount10Min;
    if ((*(_DWORD *)&v2 & 0x40000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&v2 & 0x40000) != 0)
  {
LABEL_20:
    uint64_t v33 = 2654435761 * self->_nowPlayingAbsoluteCount1Hr;
    if ((*(_DWORD *)&v2 & 0x80000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&v2 & 0x80000) != 0)
  {
LABEL_21:
    uint64_t v32 = 2654435761 * self->_nowPlayingAbsoluteCount6Hr;
    if ((*(_DWORD *)&v2 & 0x100000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&v2 & 0x100000) != 0)
  {
LABEL_22:
    uint64_t v31 = 2654435761 * self->_nowPlayingAbsoluteCount1Day;
    if ((*(_DWORD *)&v2 & 0x200000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&v2 & 0x200000) != 0)
  {
LABEL_23:
    uint64_t v4 = 2654435761 * self->_nowPlayingAbsoluteCount7Day;
    if ((*(_DWORD *)&v2 & 0x400000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v4 = 0;
  if ((*(_DWORD *)&v2 & 0x400000) != 0)
  {
LABEL_24:
    uint64_t v5 = 2654435761 * self->_nowPlayingAbsoluteCount14Day;
    if ((*(_DWORD *)&v2 & 0x800000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&v2 & 0x800000) != 0)
  {
LABEL_25:
    uint64_t v6 = 2654435761 * self->_nowPlayingAbsoluteCount28Day;
    if ((*(_DWORD *)&v2 & 0x1000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&v2 & 0x1000000) != 0)
  {
LABEL_26:
    uint64_t v7 = 2654435761 * self->_isNowPlayingApp;
    if ((*(_DWORD *)&v2 & 0x2000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&v2 & 0x2000000) != 0)
  {
LABEL_27:
    uint64_t v8 = 2654435761 * self->_isSelectedApp;
    if ((*(_DWORD *)&v2 & 0x4000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&v2 & 0x4000000) != 0)
  {
LABEL_28:
    uint64_t v9 = 2654435761 * self->_timeSinceLastForegroundAppStartInSec;
    if ((v3 & 0x8000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v9 = 0;
  if ((v3 & 0x8000000) != 0)
  {
LABEL_29:
    uint64_t v10 = 2654435761 * self->_timeSinceLastForegroundAppEndInSec;
    if ((v3 & 0x10000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v10 = 0;
  if ((v3 & 0x10000000) != 0)
  {
LABEL_30:
    uint64_t v11 = 2654435761 * self->_timeSinceLastNowPlayingAppStartInSec;
    if ((v3 & 0x20000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v11 = 0;
  if ((v3 & 0x20000000) != 0)
  {
LABEL_31:
    uint64_t v12 = 2654435761 * self->_timeSinceLastNowPlayingAppEndInSec;
    if ((v3 & 0x40000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v12 = 0;
  if ((v3 & 0x40000000) != 0)
  {
LABEL_32:
    uint64_t v13 = 2654435761 * self->_spotlightRelativeCount;
    if ((v3 & 0x80000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v13 = 0;
  if ((v3 & 0x80000000) != 0)
  {
LABEL_33:
    unint64_t v14 = 2654435761u * self->_supportedMediaCategories;
    if ((v3 & 0x100000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_81;
  }
LABEL_80:
  unint64_t v14 = 0;
  if ((v3 & 0x100000000) != 0)
  {
LABEL_34:
    uint64_t v15 = 2654435761 * self->_isForegroundApp;
    if ((v3 & 0x200000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v15 = 0;
  if ((v3 & 0x200000000) != 0)
  {
LABEL_35:
    uint64_t v16 = 2654435761 * self->_entityPartialSiriCount2Min;
    if ((v3 & 0x400000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v16 = 0;
  if ((v3 & 0x400000000) != 0)
  {
LABEL_36:
    uint64_t v17 = 2654435761 * self->_entityPartialSiriCount10Min;
    if ((v3 & 0x800000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v17 = 0;
  if ((v3 & 0x800000000) != 0)
  {
LABEL_37:
    uint64_t v18 = 2654435761 * self->_entityPartialSiriCount1Hr;
    if ((v3 & 0x1000000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v18 = 0;
  if ((v3 & 0x1000000000) != 0)
  {
LABEL_38:
    uint64_t v19 = 2654435761 * self->_entityPartialSiriCount6Hr;
    if ((v3 & 0x2000000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v19 = 0;
  if ((v3 & 0x2000000000) != 0)
  {
LABEL_39:
    uint64_t v20 = 2654435761 * self->_entityPartialSiriCount1Day;
    if ((v3 & 0x4000000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v20 = 0;
  if ((v3 & 0x4000000000) != 0)
  {
LABEL_40:
    uint64_t v21 = 2654435761 * self->_entityPartialSiriCount7Day;
    if ((v3 & 0x8000000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v21 = 0;
  if ((v3 & 0x8000000000) != 0)
  {
LABEL_41:
    uint64_t v22 = 2654435761 * self->_entityPartialSiriCount28Day;
    if ((v3 & 0x10000000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v22 = 0;
  if ((v3 & 0x10000000000) != 0)
  {
LABEL_42:
    uint64_t v23 = 2654435761 * self->_entityPartialAppCount2Min;
    if ((v3 & 0x20000000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v23 = 0;
  if ((v3 & 0x20000000000) != 0)
  {
LABEL_43:
    uint64_t v24 = 2654435761 * self->_entityPartialAppCount10Min;
    if ((v3 & 0x40000000000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v24 = 0;
  if ((v3 & 0x40000000000) != 0)
  {
LABEL_44:
    uint64_t v25 = 2654435761 * self->_entityPartialAppCount1Hr;
    if ((v3 & 0x80000000000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v25 = 0;
  if ((v3 & 0x80000000000) != 0)
  {
LABEL_45:
    uint64_t v26 = 2654435761 * self->_entityPartialAppCount6Hr;
    if ((v3 & 0x100000000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v26 = 0;
  if ((v3 & 0x100000000000) != 0)
  {
LABEL_46:
    uint64_t v27 = 2654435761 * self->_entityPartialAppCount1Day;
    if ((v3 & 0x200000000000) != 0) {
      goto LABEL_47;
    }
LABEL_94:
    uint64_t v28 = 0;
    if ((v3 & 0x400000000000) != 0) {
      goto LABEL_48;
    }
LABEL_95:
    uint64_t v29 = 0;
    return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_93:
  uint64_t v27 = 0;
  if ((v3 & 0x200000000000) == 0) {
    goto LABEL_94;
  }
LABEL_47:
  uint64_t v28 = 2654435761 * self->_entityPartialAppCount7Day;
  if ((v3 & 0x400000000000) == 0) {
    goto LABEL_95;
  }
LABEL_48:
  uint64_t v29 = 2654435761 * self->_entityPartialAppCount28Day;
  return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_192;
  }
  $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  uint64_t v6 = v4[49];
  if ((*(_DWORD *)&self->_has & 1) != (v4[49] & 1)) {
    goto LABEL_192;
  }
  if (*(unsigned char *)&v5)
  {
    int relativeAppUsage1Day = self->_relativeAppUsage1Day;
    if (relativeAppUsage1Day != [v4 relativeAppUsage1Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  else
  {
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v6 | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
  }
  unsigned int v10 = (*(_DWORD *)&v5 >> 1) & 1;
  if (v10 != ((v6 >> 1) & 1)) {
    goto LABEL_192;
  }
  if (v10)
  {
    int relativeAppUsage7Day = self->_relativeAppUsage7Day;
    if (relativeAppUsage7Day != [v4 relativeAppUsage7Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v12 = (*(_DWORD *)&v5 >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_192;
  }
  if (v12)
  {
    int relativeAppUsage14Day = self->_relativeAppUsage14Day;
    if (relativeAppUsage14Day != [v4 relativeAppUsage14Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v14 = (*(_DWORD *)&v5 >> 3) & 1;
  if (v14 != ((v6 >> 3) & 1)) {
    goto LABEL_192;
  }
  if (v14)
  {
    int entityAbsoluteCount2Min = self->_entityAbsoluteCount2Min;
    if (entityAbsoluteCount2Min != [v4 entityAbsoluteCount2Min]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v16 = (*(_DWORD *)&v5 >> 4) & 1;
  if (v16 != ((v6 >> 4) & 1)) {
    goto LABEL_192;
  }
  if (v16)
  {
    int entityAbsoluteCount10Min = self->_entityAbsoluteCount10Min;
    if (entityAbsoluteCount10Min != [v4 entityAbsoluteCount10Min]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v18 = (*(_DWORD *)&v5 >> 5) & 1;
  if (v18 != ((v6 >> 5) & 1)) {
    goto LABEL_192;
  }
  if (v18)
  {
    int entityAbsoluteCount1Hr = self->_entityAbsoluteCount1Hr;
    if (entityAbsoluteCount1Hr != [v4 entityAbsoluteCount1Hr]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v20 = (*(_DWORD *)&v5 >> 6) & 1;
  if (v20 != ((v6 >> 6) & 1)) {
    goto LABEL_192;
  }
  if (v20)
  {
    int entityAbsoluteCount6Hr = self->_entityAbsoluteCount6Hr;
    if (entityAbsoluteCount6Hr != [v4 entityAbsoluteCount6Hr]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v22 = (*(_DWORD *)&v5 >> 7) & 1;
  if (v22 != ((v6 >> 7) & 1)) {
    goto LABEL_192;
  }
  if (v22)
  {
    int entityAbsoluteCount1Day = self->_entityAbsoluteCount1Day;
    if (entityAbsoluteCount1Day != [v4 entityAbsoluteCount1Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v24 = (*(_DWORD *)&v5 >> 8) & 1;
  if (v24 != ((v6 >> 8) & 1)) {
    goto LABEL_192;
  }
  if (v24)
  {
    int entityAbsoluteCount7Day = self->_entityAbsoluteCount7Day;
    if (entityAbsoluteCount7Day != [v4 entityAbsoluteCount7Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v26 = (*(_DWORD *)&v5 >> 9) & 1;
  if (v26 != ((v6 >> 9) & 1)) {
    goto LABEL_192;
  }
  if (v26)
  {
    int entityAbsoluteCount14Day = self->_entityAbsoluteCount14Day;
    if (entityAbsoluteCount14Day != [v4 entityAbsoluteCount14Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v28 = (*(_DWORD *)&v5 >> 10) & 1;
  if (v28 != ((v6 >> 10) & 1)) {
    goto LABEL_192;
  }
  if (v28)
  {
    int entityAbsoluteCount28Day = self->_entityAbsoluteCount28Day;
    if (entityAbsoluteCount28Day != [v4 entityAbsoluteCount28Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v30 = (*(_DWORD *)&v5 >> 11) & 1;
  if (v30 != ((v6 >> 11) & 1)) {
    goto LABEL_192;
  }
  if (v30)
  {
    int entityRecency = self->_entityRecency;
    if (entityRecency != [v4 entityRecency]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v32 = (*(_DWORD *)&v5 >> 12) & 1;
  if (v32 != ((v6 >> 12) & 1)) {
    goto LABEL_192;
  }
  if (v32)
  {
    int mediaUserContextNumberOfLibraryItems = self->_mediaUserContextNumberOfLibraryItems;
    if (mediaUserContextNumberOfLibraryItems != [v4 mediaUserContextNumberOfLibraryItems]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v34 = (*(_DWORD *)&v5 >> 13) & 1;
  if (v34 != ((v6 >> 13) & 1)) {
    goto LABEL_192;
  }
  if (v34)
  {
    int mediaUserContextSubscriptionStatus = self->_mediaUserContextSubscriptionStatus;
    if (mediaUserContextSubscriptionStatus != [v4 mediaUserContextSubscriptionStatus]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v36 = (*(_DWORD *)&v5 >> 14) & 1;
  if (v36 != ((v6 >> 14) & 1)) {
    goto LABEL_192;
  }
  if (v36)
  {
    int isLastForegroundApp = self->_isLastForegroundApp;
    if (isLastForegroundApp != [v4 isLastForegroundApp]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v38 = (*(_DWORD *)&v5 >> 15) & 1;
  if (v38 != ((v6 >> 15) & 1)) {
    goto LABEL_192;
  }
  if (v38)
  {
    int isLastNowPlayingApp = self->_isLastNowPlayingApp;
    if (isLastNowPlayingApp != [v4 isLastNowPlayingApp]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v40 = HIWORD(*(_DWORD *)&v5) & 1;
  if (v40 != (WORD1(v6) & 1)) {
    goto LABEL_192;
  }
  if (v40)
  {
    int nowPlayingAbsoluteCount2Min = self->_nowPlayingAbsoluteCount2Min;
    if (nowPlayingAbsoluteCount2Min != [v4 nowPlayingAbsoluteCount2Min]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v42 = (*(_DWORD *)&v5 >> 17) & 1;
  if (v42 != ((v6 >> 17) & 1)) {
    goto LABEL_192;
  }
  if (v42)
  {
    int nowPlayingAbsoluteCount10Min = self->_nowPlayingAbsoluteCount10Min;
    if (nowPlayingAbsoluteCount10Min != [v4 nowPlayingAbsoluteCount10Min]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v44 = (*(_DWORD *)&v5 >> 18) & 1;
  if (v44 != ((v6 >> 18) & 1)) {
    goto LABEL_192;
  }
  if (v44)
  {
    int nowPlayingAbsoluteCount1Hr = self->_nowPlayingAbsoluteCount1Hr;
    if (nowPlayingAbsoluteCount1Hr != [v4 nowPlayingAbsoluteCount1Hr]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v46 = (*(_DWORD *)&v5 >> 19) & 1;
  if (v46 != ((v6 >> 19) & 1)) {
    goto LABEL_192;
  }
  if (v46)
  {
    int nowPlayingAbsoluteCount6Hr = self->_nowPlayingAbsoluteCount6Hr;
    if (nowPlayingAbsoluteCount6Hr != [v4 nowPlayingAbsoluteCount6Hr]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v48 = (*(_DWORD *)&v5 >> 20) & 1;
  if (v48 != ((v6 >> 20) & 1)) {
    goto LABEL_192;
  }
  if (v48)
  {
    int nowPlayingAbsoluteCount1Day = self->_nowPlayingAbsoluteCount1Day;
    if (nowPlayingAbsoluteCount1Day != [v4 nowPlayingAbsoluteCount1Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v50 = (*(_DWORD *)&v5 >> 21) & 1;
  if (v50 != ((v6 >> 21) & 1)) {
    goto LABEL_192;
  }
  if (v50)
  {
    int nowPlayingAbsoluteCount7Day = self->_nowPlayingAbsoluteCount7Day;
    if (nowPlayingAbsoluteCount7Day != [v4 nowPlayingAbsoluteCount7Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v52 = (*(_DWORD *)&v5 >> 22) & 1;
  if (v52 != ((v6 >> 22) & 1)) {
    goto LABEL_192;
  }
  if (v52)
  {
    int nowPlayingAbsoluteCount14Day = self->_nowPlayingAbsoluteCount14Day;
    if (nowPlayingAbsoluteCount14Day != [v4 nowPlayingAbsoluteCount14Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v54 = (*(_DWORD *)&v5 >> 23) & 1;
  if (v54 != ((v6 >> 23) & 1)) {
    goto LABEL_192;
  }
  if (v54)
  {
    int nowPlayingAbsoluteCount28Day = self->_nowPlayingAbsoluteCount28Day;
    if (nowPlayingAbsoluteCount28Day != [v4 nowPlayingAbsoluteCount28Day]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v56 = HIBYTE(*(_DWORD *)&v5) & 1;
  if (v56 != (BYTE3(v6) & 1)) {
    goto LABEL_192;
  }
  if (v56)
  {
    int isNowPlayingApp = self->_isNowPlayingApp;
    if (isNowPlayingApp != [v4 isNowPlayingApp]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v58 = (*(_DWORD *)&v5 >> 25) & 1;
  if (v58 != ((v6 >> 25) & 1)) {
    goto LABEL_192;
  }
  if (v58)
  {
    int isSelectedApp = self->_isSelectedApp;
    if (isSelectedApp != [v4 isSelectedApp]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v60 = (*(_DWORD *)&v5 >> 26) & 1;
  if (v60 != ((v6 >> 26) & 1)) {
    goto LABEL_192;
  }
  if (v60)
  {
    int timeSinceLastForegroundAppStartInSec = self->_timeSinceLastForegroundAppStartInSec;
    if (timeSinceLastForegroundAppStartInSec != [v4 timeSinceLastForegroundAppStartInSec]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v62 = (*(_DWORD *)&v5 >> 27) & 1;
  if (v62 != ((v6 >> 27) & 1)) {
    goto LABEL_192;
  }
  if (v62)
  {
    int timeSinceLastForegroundAppEndInSec = self->_timeSinceLastForegroundAppEndInSec;
    if (timeSinceLastForegroundAppEndInSec != [v4 timeSinceLastForegroundAppEndInSec]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v64 = (*(_DWORD *)&v5 >> 28) & 1;
  if (v64 != ((v6 >> 28) & 1)) {
    goto LABEL_192;
  }
  if (v64)
  {
    int timeSinceLastNowPlayingAppStartInSec = self->_timeSinceLastNowPlayingAppStartInSec;
    if (timeSinceLastNowPlayingAppStartInSec != [v4 timeSinceLastNowPlayingAppStartInSec]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v66 = (*(_DWORD *)&v5 >> 29) & 1;
  if (v66 != ((v6 >> 29) & 1)) {
    goto LABEL_192;
  }
  if (v66)
  {
    int timeSinceLastNowPlayingAppEndInSec = self->_timeSinceLastNowPlayingAppEndInSec;
    if (timeSinceLastNowPlayingAppEndInSec != [v4 timeSinceLastNowPlayingAppEndInSec]) {
      goto LABEL_192;
    }
    $36A3CCAAE4681EBA138F0132699ACCCC v5 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v7 = *(void *)&v5 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
    LODWORD(v6) = v4[49];
  }
  unsigned int v68 = (*(_DWORD *)&v5 >> 30) & 1;
  if (v68 != ((v6 >> 30) & 1)) {
    goto LABEL_192;
  }
  if (v68)
  {
    int spotlightRelativeCount = self->_spotlightRelativeCount;
    if (spotlightRelativeCount != [v4 spotlightRelativeCount]) {
      goto LABEL_192;
    }
    unint64_t v7 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    unint64_t v8 = v4[49] | ((unint64_t)*((unsigned __int16 *)v4 + 100) << 32);
  }
  if (((v8 ^ v7) & 0x80000000) != 0) {
    goto LABEL_192;
  }
  if ((v7 & 0x80000000) != 0)
  {
    unint64_t supportedMediaCategories = self->_supportedMediaCategories;
    if (supportedMediaCategories != [v4 supportedMediaCategories]) {
      goto LABEL_192;
    }
    unsigned int v70 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v71) = v70 >> 1;
    LODWORD(v72) = v70 >> 2;
    LODWORD(v73) = v70 >> 3;
    LODWORD(v74) = v70 >> 4;
    uint64_t v75 = v70 >> 5;
    uint64_t v76 = v70 >> 6;
    LODWORD(v77) = v70 >> 7;
    unsigned int v78 = v70 >> 8;
    LODWORD(v79) = v70 >> 9;
    unsigned int v96 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v143) = v70 >> 11;
    LODWORD(v81) = v96 >> 1;
    LODWORD(v142) = v70 >> 12;
    LODWORD(v82) = v96 >> 2;
    LODWORD(v145) = v70 >> 13;
    LODWORD(v146) = v70 >> 10;
    LODWORD(v83) = v96 >> 3;
    LODWORD(v144) = v70 >> 14;
    LODWORD(v84) = v96 >> 4;
    LODWORD(v85) = v96 >> 5;
    LODWORD(v86) = v96 >> 6;
    uint64_t v87 = v96 >> 7;
    uint64_t v88 = v96 >> 8;
    uint64_t v89 = v96 >> 9;
    uint64_t v90 = v96 >> 10;
    LODWORD(v91) = v96 >> 11;
    LODWORD(v92) = v96 >> 12;
    LODWORD(v93) = v96 >> 13;
    __int16 v80 = *((_WORD *)&self->_has + 2);
    LODWORD(v94) = v96 >> 14;
  }
  else
  {
    LOBYTE(v70) = BYTE4(v8);
    uint64_t v71 = (v8 >> 33) & 0x7FFF;
    uint64_t v72 = (v8 >> 34) & 0x3FFF;
    uint64_t v73 = (v8 >> 35) & 0x1FFF;
    uint64_t v74 = (v8 >> 36) & 0xFFF;
    uint64_t v75 = (v8 >> 37) & 0x7FF;
    uint64_t v76 = (v8 >> 38) & 0x3FF;
    uint64_t v77 = (v8 >> 39) & 0x1FF;
    LOBYTE(v78) = BYTE5(v8);
    uint64_t v79 = (v8 >> 41) & 0x7F;
    uint64_t v143 = (v8 >> 43) & 0x1F;
    uint64_t v142 = (v8 >> 44) & 0xF;
    uint64_t v145 = (v8 >> 45) & 7;
    uint64_t v146 = (v8 >> 42) & 0x3F;
    uint64_t v144 = (v8 >> 46) & 3;
    LOBYTE(v80) = BYTE4(v7);
    uint64_t v81 = (v7 >> 33) & 0x7FFF;
    uint64_t v82 = (v7 >> 34) & 0x3FFF;
    uint64_t v83 = (v7 >> 35) & 0x1FFF;
    uint64_t v84 = (v7 >> 36) & 0xFFF;
    uint64_t v85 = (v7 >> 37) & 0x7FF;
    uint64_t v86 = (v7 >> 38) & 0x3FF;
    uint64_t v87 = (v7 >> 39) & 0x1FF;
    uint64_t v88 = BYTE5(v7);
    uint64_t v89 = (v7 >> 41) & 0x7F;
    uint64_t v90 = (v7 >> 42) & 0x3F;
    uint64_t v91 = (v7 >> 43) & 0x1F;
    uint64_t v92 = (v7 >> 44) & 0xF;
    uint64_t v93 = (v7 >> 45) & 7;
    uint64_t v94 = (v7 >> 46) & 3;
  }
  if ((v80 & 1) != (v70 & 1)) {
    goto LABEL_192;
  }
  if (v80)
  {
    int isForegroundApp = self->_isForegroundApp;
    if (isForegroundApp != objc_msgSend(v4, "isForegroundApp", v90, v76, v89, v88, v75, v87)) {
      goto LABEL_192;
    }
    unsigned int v98 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v71) = v98 >> 1;
    LODWORD(v72) = v98 >> 2;
    LODWORD(v73) = v98 >> 3;
    LODWORD(v74) = v98 >> 4;
    uint64_t v75 = v98 >> 5;
    uint64_t v76 = v98 >> 6;
    LODWORD(v77) = v98 >> 7;
    unsigned int v78 = v98 >> 8;
    LODWORD(v79) = v98 >> 9;
    LODWORD(v146) = v98 >> 10;
    unsigned int v99 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v142) = v98 >> 12;
    LODWORD(v143) = v98 >> 11;
    LODWORD(v82) = v99 >> 2;
    LODWORD(v144) = v98 >> 14;
    LODWORD(v145) = v98 >> 13;
    LODWORD(v83) = v99 >> 3;
    LODWORD(v81) = v99 >> 1;
    LODWORD(v84) = v99 >> 4;
    LODWORD(v85) = v99 >> 5;
    LODWORD(v86) = v99 >> 6;
    uint64_t v87 = v99 >> 7;
    uint64_t v88 = v99 >> 8;
    uint64_t v89 = v99 >> 9;
    uint64_t v90 = v99 >> 10;
    LODWORD(v91) = v99 >> 11;
    LODWORD(v92) = v99 >> 12;
    LODWORD(v93) = v99 >> 13;
    LODWORD(v94) = v99 >> 14;
  }
  int v100 = v81 & 1;
  if (v100 != (v71 & 1)) {
    goto LABEL_192;
  }
  if (v100)
  {
    int entityPartialSiriCount2Min = self->_entityPartialSiriCount2Min;
    if (entityPartialSiriCount2Min != objc_msgSend(v4, "entityPartialSiriCount2Min", v90, v76, v89, v88, v75, v87))goto LABEL_192; {
    unsigned int v102 = *((unsigned __int16 *)v4 + 100);
    }
    LODWORD(v72) = v102 >> 2;
    LODWORD(v73) = v102 >> 3;
    LODWORD(v74) = v102 >> 4;
    uint64_t v75 = v102 >> 5;
    uint64_t v76 = v102 >> 6;
    LODWORD(v77) = v102 >> 7;
    unsigned int v78 = v102 >> 8;
    LODWORD(v79) = v102 >> 9;
    unsigned int v103 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v82) = v103 >> 2;
    LODWORD(v142) = v102 >> 12;
    LODWORD(v143) = v102 >> 11;
    LODWORD(v145) = v102 >> 13;
    LODWORD(v146) = v102 >> 10;
    LODWORD(v83) = v103 >> 3;
    LODWORD(v144) = v102 >> 14;
    LODWORD(v84) = v103 >> 4;
    LODWORD(v85) = v103 >> 5;
    LODWORD(v86) = v103 >> 6;
    uint64_t v87 = v103 >> 7;
    uint64_t v88 = v103 >> 8;
    uint64_t v89 = v103 >> 9;
    uint64_t v90 = v103 >> 10;
    LODWORD(v91) = v103 >> 11;
    LODWORD(v92) = v103 >> 12;
    LODWORD(v93) = v103 >> 13;
    LODWORD(v94) = v103 >> 14;
  }
  if ((v82 & 1) != (v72 & 1)) {
    goto LABEL_192;
  }
  if (v82)
  {
    int entityPartialSiriCount10Min = self->_entityPartialSiriCount10Min;
    if (entityPartialSiriCount10Min != objc_msgSend(v4, "entityPartialSiriCount10Min", v90, v76, v89, v88, v75, v87))goto LABEL_192; {
    unsigned int v105 = *((unsigned __int16 *)v4 + 100);
    }
    LODWORD(v73) = v105 >> 3;
    LODWORD(v74) = v105 >> 4;
    uint64_t v75 = v105 >> 5;
    uint64_t v76 = v105 >> 6;
    LODWORD(v77) = v105 >> 7;
    unsigned int v78 = v105 >> 8;
    LODWORD(v79) = v105 >> 9;
    unsigned int v106 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v83) = v106 >> 3;
    LODWORD(v84) = v106 >> 4;
    LODWORD(v142) = v105 >> 12;
    LODWORD(v143) = v105 >> 11;
    LODWORD(v145) = v105 >> 13;
    LODWORD(v146) = v105 >> 10;
    LODWORD(v144) = v105 >> 14;
    LODWORD(v85) = v106 >> 5;
    LODWORD(v86) = v106 >> 6;
    uint64_t v87 = v106 >> 7;
    uint64_t v88 = v106 >> 8;
    uint64_t v89 = v106 >> 9;
    uint64_t v90 = v106 >> 10;
    LODWORD(v91) = v106 >> 11;
    LODWORD(v92) = v106 >> 12;
    LODWORD(v93) = v106 >> 13;
    LODWORD(v94) = v106 >> 14;
  }
  if ((v83 & 1) != (v73 & 1)) {
    goto LABEL_192;
  }
  if (v83)
  {
    int entityPartialSiriCount1Hr = self->_entityPartialSiriCount1Hr;
    if (entityPartialSiriCount1Hr != objc_msgSend(v4, "entityPartialSiriCount1Hr", v90, v76, v89, v88, v75, v87))goto LABEL_192; {
    unsigned int v108 = *((unsigned __int16 *)v4 + 100);
    }
    LODWORD(v74) = v108 >> 4;
    uint64_t v75 = v108 >> 5;
    uint64_t v76 = v108 >> 6;
    LODWORD(v77) = v108 >> 7;
    unsigned int v78 = v108 >> 8;
    LODWORD(v79) = v108 >> 9;
    unsigned int v109 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v84) = v109 >> 4;
    LODWORD(v85) = v109 >> 5;
    LODWORD(v86) = v109 >> 6;
    LODWORD(v142) = v108 >> 12;
    LODWORD(v143) = v108 >> 11;
    LODWORD(v145) = v108 >> 13;
    LODWORD(v146) = v108 >> 10;
    LODWORD(v144) = v108 >> 14;
    uint64_t v87 = v109 >> 7;
    uint64_t v88 = v109 >> 8;
    uint64_t v89 = v109 >> 9;
    uint64_t v90 = v109 >> 10;
    LODWORD(v91) = v109 >> 11;
    LODWORD(v92) = v109 >> 12;
    LODWORD(v93) = v109 >> 13;
    LODWORD(v94) = v109 >> 14;
  }
  if ((v84 & 1) != (v74 & 1)) {
    goto LABEL_192;
  }
  if (v84)
  {
    int entityPartialSiriCount6Hr = self->_entityPartialSiriCount6Hr;
    if (entityPartialSiriCount6Hr != objc_msgSend(v4, "entityPartialSiriCount6Hr", v90, v76, v89, v88, v75, v87))goto LABEL_192; {
    unsigned int v111 = *((unsigned __int16 *)v4 + 100);
    }
    LODWORD(v75) = v111 >> 5;
    uint64_t v76 = v111 >> 6;
    LODWORD(v77) = v111 >> 7;
    unsigned int v78 = v111 >> 8;
    LODWORD(v79) = v111 >> 9;
    unsigned int v112 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v85) = v112 >> 5;
    LODWORD(v86) = v112 >> 6;
    LODWORD(v87) = v112 >> 7;
    uint64_t v88 = v112 >> 8;
    LODWORD(v142) = v111 >> 12;
    LODWORD(v143) = v111 >> 11;
    LODWORD(v145) = v111 >> 13;
    LODWORD(v146) = v111 >> 10;
    LODWORD(v144) = v111 >> 14;
    uint64_t v89 = v112 >> 9;
    uint64_t v90 = v112 >> 10;
    LODWORD(v91) = v112 >> 11;
    LODWORD(v92) = v112 >> 12;
    LODWORD(v93) = v112 >> 13;
    LODWORD(v94) = v112 >> 14;
  }
  if ((v85 & 1) != (v75 & 1)) {
    goto LABEL_192;
  }
  if (v85)
  {
    int entityPartialSiriCount1Day = self->_entityPartialSiriCount1Day;
    if (entityPartialSiriCount1Day != objc_msgSend(v4, "entityPartialSiriCount1Day", v90, v76, v89, v88)) {
      goto LABEL_192;
    }
    unsigned int v114 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v76) = v114 >> 6;
    LODWORD(v77) = v114 >> 7;
    unsigned int v78 = v114 >> 8;
    LODWORD(v79) = v114 >> 9;
    unsigned int v115 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v86) = v115 >> 6;
    LODWORD(v87) = v115 >> 7;
    LODWORD(v88) = v115 >> 8;
    LODWORD(v89) = v115 >> 9;
    uint64_t v90 = v115 >> 10;
    LODWORD(v142) = v114 >> 12;
    LODWORD(v143) = v114 >> 11;
    LODWORD(v145) = v114 >> 13;
    LODWORD(v146) = v114 >> 10;
    LODWORD(v144) = v114 >> 14;
    LODWORD(v91) = v115 >> 11;
    LODWORD(v92) = v115 >> 12;
    LODWORD(v93) = v115 >> 13;
    LODWORD(v94) = v115 >> 14;
  }
  if ((v86 & 1) != (v76 & 1)) {
    goto LABEL_192;
  }
  if (v86)
  {
    int entityPartialSiriCount7Day = self->_entityPartialSiriCount7Day;
    if (entityPartialSiriCount7Day != objc_msgSend(v4, "entityPartialSiriCount7Day", v90)) {
      goto LABEL_192;
    }
    unsigned int v117 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v77) = v117 >> 7;
    unsigned int v78 = v117 >> 8;
    LODWORD(v79) = v117 >> 9;
    unsigned int v118 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v87) = v118 >> 7;
    LODWORD(v88) = v118 >> 8;
    LODWORD(v89) = v118 >> 9;
    uint64_t v90 = v118 >> 10;
    LODWORD(v91) = v118 >> 11;
    LODWORD(v92) = v118 >> 12;
    LODWORD(v142) = v117 >> 12;
    LODWORD(v143) = v117 >> 11;
    LODWORD(v145) = v117 >> 13;
    LODWORD(v146) = v117 >> 10;
    LODWORD(v144) = v117 >> 14;
    LODWORD(v93) = v118 >> 13;
    LODWORD(v94) = v118 >> 14;
  }
  if ((v87 & 1) != (v77 & 1)) {
    goto LABEL_192;
  }
  if (v87)
  {
    int entityPartialSiriCount28Day = self->_entityPartialSiriCount28Day;
    if (entityPartialSiriCount28Day != objc_msgSend(v4, "entityPartialSiriCount28Day", v90)) {
      goto LABEL_192;
    }
    unsigned int v120 = *((unsigned __int16 *)v4 + 100);
    unsigned int v78 = v120 >> 8;
    LODWORD(v79) = v120 >> 9;
    unsigned int v121 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v88) = v121 >> 8;
    LODWORD(v89) = v121 >> 9;
    uint64_t v90 = v121 >> 10;
    LODWORD(v91) = v121 >> 11;
    LODWORD(v92) = v121 >> 12;
    LODWORD(v93) = v121 >> 13;
    LODWORD(v94) = v121 >> 14;
    LODWORD(v142) = v120 >> 12;
    LODWORD(v143) = v120 >> 11;
    LODWORD(v145) = v120 >> 13;
    LODWORD(v146) = v120 >> 10;
    LODWORD(v144) = v120 >> 14;
  }
  if ((v88 & 1) != (v78 & 1)) {
    goto LABEL_192;
  }
  if (v88)
  {
    int entityPartialAppCount2Min = self->_entityPartialAppCount2Min;
    if (entityPartialAppCount2Min != objc_msgSend(v4, "entityPartialAppCount2Min", v90)) {
      goto LABEL_192;
    }
    unsigned int v123 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v79) = v123 >> 9;
    unsigned int v124 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v89) = v124 >> 9;
    uint64_t v90 = v124 >> 10;
    LODWORD(v91) = v124 >> 11;
    LODWORD(v92) = v124 >> 12;
    LODWORD(v93) = v124 >> 13;
    LODWORD(v94) = v124 >> 14;
    LODWORD(v142) = v123 >> 12;
    LODWORD(v143) = v123 >> 11;
    LODWORD(v145) = v123 >> 13;
    LODWORD(v146) = v123 >> 10;
    LODWORD(v144) = v123 >> 14;
  }
  if ((v89 & 1) != (v79 & 1)) {
    goto LABEL_192;
  }
  if (v89)
  {
    int entityPartialAppCount10Min = self->_entityPartialAppCount10Min;
    if (entityPartialAppCount10Min != objc_msgSend(v4, "entityPartialAppCount10Min", v90)) {
      goto LABEL_192;
    }
    unsigned int v126 = *((unsigned __int16 *)v4 + 100);
    unsigned int v127 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v90) = v127 >> 10;
    LODWORD(v91) = v127 >> 11;
    LODWORD(v92) = v127 >> 12;
    LODWORD(v93) = v127 >> 13;
    LODWORD(v94) = v127 >> 14;
    LODWORD(v142) = v126 >> 12;
    LODWORD(v143) = v126 >> 11;
    LODWORD(v145) = v126 >> 13;
    LODWORD(v146) = v126 >> 10;
    LODWORD(v144) = v126 >> 14;
  }
  if ((v90 & 1) != (v146 & 1)) {
    goto LABEL_192;
  }
  if (v90)
  {
    int entityPartialAppCount1Hr = self->_entityPartialAppCount1Hr;
    if (entityPartialAppCount1Hr != [v4 entityPartialAppCount1Hr]) {
      goto LABEL_192;
    }
    unsigned int v129 = *((unsigned __int16 *)v4 + 100);
    unsigned int v130 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v91) = v130 >> 11;
    LODWORD(v92) = v130 >> 12;
    LODWORD(v93) = v130 >> 13;
    LODWORD(v94) = v130 >> 14;
    LODWORD(v142) = v129 >> 12;
    LODWORD(v143) = v129 >> 11;
    LODWORD(v144) = v129 >> 14;
    LODWORD(v145) = v129 >> 13;
  }
  if ((v91 & 1) != (v143 & 1)) {
    goto LABEL_192;
  }
  if (v91)
  {
    int entityPartialAppCount6Hr = self->_entityPartialAppCount6Hr;
    if (entityPartialAppCount6Hr != [v4 entityPartialAppCount6Hr]) {
      goto LABEL_192;
    }
    unsigned int v132 = *((unsigned __int16 *)v4 + 100);
    unsigned int v133 = *((unsigned __int16 *)&self->_has + 2);
    LODWORD(v92) = v133 >> 12;
    LODWORD(v93) = v133 >> 13;
    LODWORD(v94) = v133 >> 14;
    LODWORD(v142) = v132 >> 12;
    LODWORD(v144) = v132 >> 14;
    LODWORD(v145) = v132 >> 13;
  }
  if ((v92 & 1) != (v142 & 1)) {
    goto LABEL_192;
  }
  if (v92)
  {
    int entityPartialAppCount1Day = self->_entityPartialAppCount1Day;
    if (entityPartialAppCount1Day != [v4 entityPartialAppCount1Day]) {
      goto LABEL_192;
    }
    unsigned int v135 = *((unsigned __int16 *)&self->_has + 2);
    unsigned int v136 = *((unsigned __int16 *)v4 + 100);
    LODWORD(v93) = v135 >> 13;
    LODWORD(v94) = v135 >> 14;
    LODWORD(v144) = v136 >> 14;
    LODWORD(v145) = v136 >> 13;
  }
  if ((v93 & 1) != (v145 & 1)) {
    goto LABEL_192;
  }
  if (v93)
  {
    int entityPartialAppCount7Day = self->_entityPartialAppCount7Day;
    if (entityPartialAppCount7Day == [v4 entityPartialAppCount7Day])
    {
      LODWORD(v94) = *((unsigned __int16 *)&self->_has + 2) >> 14;
      LODWORD(v144) = *((unsigned __int16 *)v4 + 100) >> 14;
      goto LABEL_188;
    }
LABEL_192:
    BOOL v140 = 0;
    goto LABEL_193;
  }
LABEL_188:
  int v138 = v94 & 1;
  if (v138 != (v144 & 1)) {
    goto LABEL_192;
  }
  if (v138)
  {
    int entityPartialAppCount28Day = self->_entityPartialAppCount28Day;
    if (entityPartialAppCount28Day != [v4 entityPartialAppCount28Day]) {
      goto LABEL_192;
    }
  }
  BOOL v140 = 1;
LABEL_193:

  return v140;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  $36A3CCAAE4681EBA138F0132699ACCCC v4 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v5 = *(void *)&v4 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if (*(unsigned char *)&v4)
  {
    PBDataWriterWriteInt32Field();
    $36A3CCAAE4681EBA138F0132699ACCCC v6 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
    unint64_t v5 = *(void *)&v6 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000) == 0)
  {
LABEL_20:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000) == 0)
  {
LABEL_21:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x100000) == 0)
  {
LABEL_22:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x200000) == 0)
  {
LABEL_23:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x400000) == 0)
  {
LABEL_24:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x800000) == 0)
  {
LABEL_25:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x2000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x8000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x20000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x40000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((*(_DWORD *)&self->_has & 0x80000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_34:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_35:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_42:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_45:
    if ((v5 & 0x100000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_46:
    if ((v5 & 0x200000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt32Field();
  unint64_t v5 = *(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x400000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  if (((*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0x400000000000) != 0) {
LABEL_48:
  }
    PBDataWriterWriteInt32Field();
LABEL_49:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteEntityPartialAppCount28Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialAppCount28Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFBFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialAppCount28Day:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFBFFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialAppCount28Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 14) & 1;
}

- (void)setEntityPartialAppCount28Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x400000000000) >> 32;
  self->_int entityPartialAppCount28Day = a3;
}

- (void)deleteEntityPartialAppCount7Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialAppCount7Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFDFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialAppCount7Day:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFDFFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialAppCount7Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 13) & 1;
}

- (void)setEntityPartialAppCount7Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x200000000000) >> 32;
  self->_int entityPartialAppCount7Day = a3;
}

- (void)deleteEntityPartialAppCount1Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialAppCount1Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFEFFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialAppCount1Day:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFEFFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialAppCount1Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 12) & 1;
}

- (void)setEntityPartialAppCount1Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x100000000000) >> 32;
  self->_int entityPartialAppCount1Day = a3;
}

- (void)deleteEntityPartialAppCount6Hr
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialAppCount6Hr:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFF7FFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialAppCount6Hr:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFF7FFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialAppCount6Hr
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 11) & 1;
}

- (void)setEntityPartialAppCount6Hr:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x80000000000) >> 32;
  self->_int entityPartialAppCount6Hr = a3;
}

- (void)deleteEntityPartialAppCount1Hr
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialAppCount1Hr:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFBFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialAppCount1Hr:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFBFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialAppCount1Hr
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 10) & 1;
}

- (void)setEntityPartialAppCount1Hr:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x40000000000) >> 32;
  self->_int entityPartialAppCount1Hr = a3;
}

- (void)deleteEntityPartialAppCount10Min
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialAppCount10Min:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFDFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialAppCount10Min:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFDFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialAppCount10Min
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 9) & 1;
}

- (void)setEntityPartialAppCount10Min:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x20000000000) >> 32;
  self->_int entityPartialAppCount10Min = a3;
}

- (void)deleteEntityPartialAppCount2Min
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialAppCount2Min:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFEFFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialAppCount2Min:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFEFFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialAppCount2Min
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setEntityPartialAppCount2Min:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x10000000000) >> 32;
  self->_int entityPartialAppCount2Min = a3;
}

- (void)deleteEntityPartialSiriCount28Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialSiriCount28Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFF7FFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialSiriCount28Day:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFF7FFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialSiriCount28Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 7) & 1;
}

- (void)setEntityPartialSiriCount28Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x8000000000) >> 32;
  self->_int entityPartialSiriCount28Day = a3;
}

- (void)deleteEntityPartialSiriCount7Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialSiriCount7Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFBFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialSiriCount7Day:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFBFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialSiriCount7Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 6) & 1;
}

- (void)setEntityPartialSiriCount7Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x4000000000) >> 32;
  self->_int entityPartialSiriCount7Day = a3;
}

- (void)deleteEntityPartialSiriCount1Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialSiriCount1Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFDFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialSiriCount1Day:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFDFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialSiriCount1Day
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 5) & 1;
}

- (void)setEntityPartialSiriCount1Day:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x2000000000) >> 32;
  self->_int entityPartialSiriCount1Day = a3;
}

- (void)deleteEntityPartialSiriCount6Hr
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialSiriCount6Hr:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFEFFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialSiriCount6Hr:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFEFFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialSiriCount6Hr
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 4) & 1;
}

- (void)setEntityPartialSiriCount6Hr:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x1000000000) >> 32;
  self->_int entityPartialSiriCount6Hr = a3;
}

- (void)deleteEntityPartialSiriCount1Hr
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialSiriCount1Hr:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFF7FFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialSiriCount1Hr:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFF7FFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialSiriCount1Hr
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 3) & 1;
}

- (void)setEntityPartialSiriCount1Hr:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x800000000) >> 32;
  self->_int entityPartialSiriCount1Hr = a3;
}

- (void)deleteEntityPartialSiriCount10Min
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialSiriCount10Min:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFBFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialSiriCount10Min:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFBFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialSiriCount10Min
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 2) & 1;
}

- (void)setEntityPartialSiriCount10Min:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x400000000) >> 32;
  self->_int entityPartialSiriCount10Min = a3;
}

- (void)deleteEntityPartialSiriCount2Min
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityPartialSiriCount2Min:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFDFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityPartialSiriCount2Min:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityPartialSiriCount2Min
{
  return (*((unsigned __int16 *)&self->_has + 2) >> 1) & 1;
}

- (void)setEntityPartialSiriCount2Min:(int)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x200000000) >> 32;
  self->_int entityPartialSiriCount2Min = a3;
}

- (void)deleteIsForegroundApp
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setIsForegroundApp:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = (*(void *)&v3 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
  *(_DWORD *)&self->_has = v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsForegroundApp:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32)) & 0xFFFFFFFEFFFFFFFFLL | v3;
  *(_DWORD *)&self->_has = self->_has;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsForegroundApp
{
  return *((_WORD *)&self->_has + 2) & 1;
}

- (void)setIsForegroundApp:(BOOL)a3
{
  *((_WORD *)&self->_has + 2) = (*(_DWORD *)&self->_has | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32) | 0x100000000) >> 32;
  self->_int isForegroundApp = a3;
}

- (void)deleteSupportedMediaCategories
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setSupportedMediaCategories:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0x7FFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasSupportedMediaCategories:(BOOL)a3
{
  unsigned int v3 = 0x80000000;
  if (!a3) {
    unsigned int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0x7FFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0x7FFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasSupportedMediaCategories
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setSupportedMediaCategories:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_unint64_t supportedMediaCategories = a3;
}

- (void)deleteSpotlightRelativeCount
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setSpotlightRelativeCount:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xBFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasSpotlightRelativeCount:(BOOL)a3
{
  int v3 = 0x40000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xBFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xBFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasSpotlightRelativeCount
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 30) & 1;
}

- (void)setSpotlightRelativeCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_int spotlightRelativeCount = a3;
}

- (void)deleteTimeSinceLastNowPlayingAppEndInSec
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setTimeSinceLastNowPlayingAppEndInSec:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xDFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasTimeSinceLastNowPlayingAppEndInSec:(BOOL)a3
{
  int v3 = 0x20000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xDFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xDFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasTimeSinceLastNowPlayingAppEndInSec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 29) & 1;
}

- (void)setTimeSinceLastNowPlayingAppEndInSec:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_int timeSinceLastNowPlayingAppEndInSec = a3;
}

- (void)deleteTimeSinceLastNowPlayingAppStartInSec
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setTimeSinceLastNowPlayingAppStartInSec:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xEFFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasTimeSinceLastNowPlayingAppStartInSec:(BOOL)a3
{
  int v3 = 0x10000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xEFFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xEFFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasTimeSinceLastNowPlayingAppStartInSec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 28) & 1;
}

- (void)setTimeSinceLastNowPlayingAppStartInSec:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_int timeSinceLastNowPlayingAppStartInSec = a3;
}

- (void)deleteTimeSinceLastForegroundAppEndInSec
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setTimeSinceLastForegroundAppEndInSec:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFF7FFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xF7FFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasTimeSinceLastForegroundAppEndInSec:(BOOL)a3
{
  int v3 = 0x8000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xF7FFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xF7FFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasTimeSinceLastForegroundAppEndInSec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 27) & 1;
}

- (void)setTimeSinceLastForegroundAppEndInSec:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_int timeSinceLastForegroundAppEndInSec = a3;
}

- (void)deleteTimeSinceLastForegroundAppStartInSec
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setTimeSinceLastForegroundAppStartInSec:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFBFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasTimeSinceLastForegroundAppStartInSec:(BOOL)a3
{
  int v3 = 0x4000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFBFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFBFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasTimeSinceLastForegroundAppStartInSec
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 26) & 1;
}

- (void)setTimeSinceLastForegroundAppStartInSec:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_int timeSinceLastForegroundAppStartInSec = a3;
}

- (void)deleteIsSelectedApp
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setIsSelectedApp:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFDFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsSelectedApp:(BOOL)a3
{
  int v3 = 0x2000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFDFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFDFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsSelectedApp
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 25) & 1;
}

- (void)setIsSelectedApp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_int isSelectedApp = a3;
}

- (void)deleteIsNowPlayingApp
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setIsNowPlayingApp:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFEFFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsNowPlayingApp:(BOOL)a3
{
  int v3 = 0x1000000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFEFFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFEFFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsNowPlayingApp
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 24) & 1;
}

- (void)setIsNowPlayingApp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_int isNowPlayingApp = a3;
}

- (void)deleteNowPlayingAbsoluteCount28Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setNowPlayingAbsoluteCount28Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFF7FFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNowPlayingAbsoluteCount28Day:(BOOL)a3
{
  int v3 = 0x800000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFF7FFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFF7FFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNowPlayingAbsoluteCount28Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 23) & 1;
}

- (void)setNowPlayingAbsoluteCount28Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_int nowPlayingAbsoluteCount28Day = a3;
}

- (void)deleteNowPlayingAbsoluteCount14Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setNowPlayingAbsoluteCount14Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFBFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFBFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNowPlayingAbsoluteCount14Day:(BOOL)a3
{
  int v3 = 0x400000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFBFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFBFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNowPlayingAbsoluteCount14Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 22) & 1;
}

- (void)setNowPlayingAbsoluteCount14Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_int nowPlayingAbsoluteCount14Day = a3;
}

- (void)deleteNowPlayingAbsoluteCount7Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setNowPlayingAbsoluteCount7Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFDFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNowPlayingAbsoluteCount7Day:(BOOL)a3
{
  int v3 = 0x200000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFDFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFDFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNowPlayingAbsoluteCount7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 21) & 1;
}

- (void)setNowPlayingAbsoluteCount7Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_int nowPlayingAbsoluteCount7Day = a3;
}

- (void)deleteNowPlayingAbsoluteCount1Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setNowPlayingAbsoluteCount1Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFEFFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNowPlayingAbsoluteCount1Day:(BOOL)a3
{
  int v3 = 0x100000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFEFFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFEFFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNowPlayingAbsoluteCount1Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 20) & 1;
}

- (void)setNowPlayingAbsoluteCount1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_int nowPlayingAbsoluteCount1Day = a3;
}

- (void)deleteNowPlayingAbsoluteCount6Hr
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setNowPlayingAbsoluteCount6Hr:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFF7FFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNowPlayingAbsoluteCount6Hr:(BOOL)a3
{
  int v3 = 0x80000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFF7FFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFF7FFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNowPlayingAbsoluteCount6Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 19) & 1;
}

- (void)setNowPlayingAbsoluteCount6Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_int nowPlayingAbsoluteCount6Hr = a3;
}

- (void)deleteNowPlayingAbsoluteCount1Hr
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setNowPlayingAbsoluteCount1Hr:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFBFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNowPlayingAbsoluteCount1Hr:(BOOL)a3
{
  int v3 = 0x40000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFBFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFBFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNowPlayingAbsoluteCount1Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 18) & 1;
}

- (void)setNowPlayingAbsoluteCount1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_int nowPlayingAbsoluteCount1Hr = a3;
}

- (void)deleteNowPlayingAbsoluteCount10Min
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setNowPlayingAbsoluteCount10Min:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFDFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFDFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNowPlayingAbsoluteCount10Min:(BOOL)a3
{
  int v3 = 0x20000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFDFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFDFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNowPlayingAbsoluteCount10Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 17) & 1;
}

- (void)setNowPlayingAbsoluteCount10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_int nowPlayingAbsoluteCount10Min = a3;
}

- (void)deleteNowPlayingAbsoluteCount2Min
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setNowPlayingAbsoluteCount2Min:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFEFFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasNowPlayingAbsoluteCount2Min:(BOOL)a3
{
  int v3 = 0x10000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFEFFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFEFFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasNowPlayingAbsoluteCount2Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 16) & 1;
}

- (void)setNowPlayingAbsoluteCount2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_int nowPlayingAbsoluteCount2Min = a3;
}

- (void)deleteIsLastNowPlayingApp
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setIsLastNowPlayingApp:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFF7FFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsLastNowPlayingApp:(BOOL)a3
{
  int v3 = 0x8000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFF7FFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFF7FFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsLastNowPlayingApp
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 15) & 1;
}

- (void)setIsLastNowPlayingApp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_int isLastNowPlayingApp = a3;
}

- (void)deleteIsLastForegroundApp
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setIsLastForegroundApp:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFBFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasIsLastForegroundApp:(BOOL)a3
{
  int v3 = 0x4000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFBFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFBFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasIsLastForegroundApp
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 14) & 1;
}

- (void)setIsLastForegroundApp:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_int isLastForegroundApp = a3;
}

- (void)deleteMediaUserContextSubscriptionStatus
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setMediaUserContextSubscriptionStatus:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFDFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasMediaUserContextSubscriptionStatus:(BOOL)a3
{
  int v3 = 0x2000;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFDFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFDFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasMediaUserContextSubscriptionStatus
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 13) & 1;
}

- (void)setMediaUserContextSubscriptionStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_int mediaUserContextSubscriptionStatus = a3;
}

- (void)deleteMediaUserContextNumberOfLibraryItems
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setMediaUserContextNumberOfLibraryItems:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFEFFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasMediaUserContextNumberOfLibraryItems:(BOOL)a3
{
  int v3 = 4096;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFEFFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFEFFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasMediaUserContextNumberOfLibraryItems
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 12) & 1;
}

- (void)setMediaUserContextNumberOfLibraryItems:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_int mediaUserContextNumberOfLibraryItems = a3;
}

- (void)deleteEntityRecency
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityRecency:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFF7FF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityRecency:(BOOL)a3
{
  int v3 = 2048;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFF7FF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFF7FF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityRecency
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 11) & 1;
}

- (void)setEntityRecency:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_int entityRecency = a3;
}

- (void)deleteEntityAbsoluteCount28Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityAbsoluteCount28Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFBFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityAbsoluteCount28Day:(BOOL)a3
{
  int v3 = 1024;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFBFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFBFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityAbsoluteCount28Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 10) & 1;
}

- (void)setEntityAbsoluteCount28Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_int entityAbsoluteCount28Day = a3;
}

- (void)deleteEntityAbsoluteCount14Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityAbsoluteCount14Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFDFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityAbsoluteCount14Day:(BOOL)a3
{
  int v3 = 512;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFDFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFDFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityAbsoluteCount14Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 9) & 1;
}

- (void)setEntityAbsoluteCount14Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_int entityAbsoluteCount14Day = a3;
}

- (void)deleteEntityAbsoluteCount7Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityAbsoluteCount7Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFEFF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityAbsoluteCount7Day:(BOOL)a3
{
  int v3 = 256;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFEFF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFEFF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityAbsoluteCount7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 8) & 1;
}

- (void)setEntityAbsoluteCount7Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_int entityAbsoluteCount7Day = a3;
}

- (void)deleteEntityAbsoluteCount1Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityAbsoluteCount1Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFF7FLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFF7F;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityAbsoluteCount1Day:(BOOL)a3
{
  int v3 = 128;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFF7F | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFF7F | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityAbsoluteCount1Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 7) & 1;
}

- (void)setEntityAbsoluteCount1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_int entityAbsoluteCount1Day = a3;
}

- (void)deleteEntityAbsoluteCount6Hr
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityAbsoluteCount6Hr:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFBF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityAbsoluteCount6Hr:(BOOL)a3
{
  int v3 = 64;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFBF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFBF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityAbsoluteCount6Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 6) & 1;
}

- (void)setEntityAbsoluteCount6Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_int entityAbsoluteCount6Hr = a3;
}

- (void)deleteEntityAbsoluteCount1Hr
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityAbsoluteCount1Hr:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFDFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFDF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityAbsoluteCount1Hr:(BOOL)a3
{
  int v3 = 32;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFDF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFDF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityAbsoluteCount1Hr
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 5) & 1;
}

- (void)setEntityAbsoluteCount1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_int entityAbsoluteCount1Hr = a3;
}

- (void)deleteEntityAbsoluteCount10Min
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityAbsoluteCount10Min:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFEFLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFEF;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityAbsoluteCount10Min:(BOOL)a3
{
  int v3 = 16;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFEF | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFEF | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityAbsoluteCount10Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 4) & 1;
}

- (void)setEntityAbsoluteCount10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_int entityAbsoluteCount10Min = a3;
}

- (void)deleteEntityAbsoluteCount2Min
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setEntityAbsoluteCount2Min:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFF7 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFF7;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasEntityAbsoluteCount2Min:(BOOL)a3
{
  int v3 = 8;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFF7 | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFF7 | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasEntityAbsoluteCount2Min
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 3) & 1;
}

- (void)setEntityAbsoluteCount2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_int entityAbsoluteCount2Min = a3;
}

- (void)deleteRelativeAppUsage14Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setRelativeAppUsage14Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFFBLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFFB;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasRelativeAppUsage14Day:(BOOL)a3
{
  int v3 = 4;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFFB | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFB | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasRelativeAppUsage14Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 2) & 1;
}

- (void)setRelativeAppUsage14Day:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_int relativeAppUsage14Day = a3;
}

- (void)deleteRelativeAppUsage7Day
{
  [(INFERENCESchemaINFERENCEVideoPlayOnThirdPartyAppDependentSignals *)self setRelativeAppUsage7Day:0];
  $36A3CCAAE4681EBA138F0132699ACCCC v3 = ($36A3CCAAE4681EBA138F0132699ACCCC)*(_DWORD *)&self->_has;
  unint64_t v4 = *(void *)&v3 & 0xFFFFFFFFFFFFFFFDLL | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&v3 & 0xFFFFFFFD;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (void)setHasRelativeAppUsage7Day:(BOOL)a3
{
  int v3 = 2;
  if (!a3) {
    int v3 = 0;
  }
  unint64_t v4 = *(_DWORD *)&self->_has & 0xFFFFFFFD | ((unint64_t)*((unsigned __int16 *)&self->_has + 2) << 32);
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFD | v3;
  *((_WORD *)&self->_has + 2) = WORD2(v4);
}

- (BOOL)hasRelativeAppUsage7Day
{
  return ((unint64_t)*(_DWORD *)&self->_has >> 1) & 1;
}

- (void)setRelativeAppUsage7Day:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_int relativeAppUsage7Day = a3;
}

- (void)deleteRelativeAppUsage1Day
{
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setHasRelativeAppUsage1Day:(BOOL)a3
{
  *(_DWORD *)&self->_has = *(_DWORD *)&self->_has & 0xFFFFFFFE | a3;
}

- (BOOL)hasRelativeAppUsage1Day
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRelativeAppUsage1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_int relativeAppUsage1Day = a3;
}

@end