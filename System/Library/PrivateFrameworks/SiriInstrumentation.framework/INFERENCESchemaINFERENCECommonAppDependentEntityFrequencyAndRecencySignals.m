@interface INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals
- (BOOL)hasAppUsageCountForEntity10Min;
- (BOOL)hasAppUsageCountForEntity14Days;
- (BOOL)hasAppUsageCountForEntity1Day;
- (BOOL)hasAppUsageCountForEntity1Hr;
- (BOOL)hasAppUsageCountForEntity28Days;
- (BOOL)hasAppUsageCountForEntity2Min;
- (BOOL)hasAppUsageCountForEntity6Hrs;
- (BOOL)hasAppUsageCountForEntity7Days;
- (BOOL)hasAppUsageCountForEntityFromSiri10Min;
- (BOOL)hasAppUsageCountForEntityFromSiri14Days;
- (BOOL)hasAppUsageCountForEntityFromSiri1Day;
- (BOOL)hasAppUsageCountForEntityFromSiri1Hr;
- (BOOL)hasAppUsageCountForEntityFromSiri28Days;
- (BOOL)hasAppUsageCountForEntityFromSiri2Min;
- (BOOL)hasAppUsageCountForEntityFromSiri6Hrs;
- (BOOL)hasAppUsageCountForEntityFromSiri7Days;
- (BOOL)hasAppUsageCountForEntityFromSiriInf;
- (BOOL)hasAppUsageCountForEntityInf;
- (BOOL)hasRecencyOrderOfAppUsageForEntityFromSiri;
- (BOOL)hasRecencyOrderOfAppUsedForEntity;
- (BOOL)hasTaskAbandonCountForEntityInUsingApp10Min;
- (BOOL)hasTaskAbandonCountForEntityInUsingApp14Days;
- (BOOL)hasTaskAbandonCountForEntityInUsingApp1Day;
- (BOOL)hasTaskAbandonCountForEntityInUsingApp1Hr;
- (BOOL)hasTaskAbandonCountForEntityInUsingApp28Days;
- (BOOL)hasTaskAbandonCountForEntityInUsingApp2Min;
- (BOOL)hasTaskAbandonCountForEntityInUsingApp6Hrs;
- (BOOL)hasTaskAbandonCountForEntityInUsingApp7Days;
- (BOOL)hasTaskAbandonCountForEntityInUsingAppInf;
- (BOOL)hasTimeSinceAppUsedForEntityFromSiriInSec;
- (BOOL)hasTimeSinceAppUsedForEntityInSec;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appUsageCountForEntity10Min;
- (int)appUsageCountForEntity14Days;
- (int)appUsageCountForEntity1Day;
- (int)appUsageCountForEntity1Hr;
- (int)appUsageCountForEntity28Days;
- (int)appUsageCountForEntity2Min;
- (int)appUsageCountForEntity6Hrs;
- (int)appUsageCountForEntity7Days;
- (int)appUsageCountForEntityFromSiri10Min;
- (int)appUsageCountForEntityFromSiri14Days;
- (int)appUsageCountForEntityFromSiri1Day;
- (int)appUsageCountForEntityFromSiri1Hr;
- (int)appUsageCountForEntityFromSiri28Days;
- (int)appUsageCountForEntityFromSiri2Min;
- (int)appUsageCountForEntityFromSiri6Hrs;
- (int)appUsageCountForEntityFromSiri7Days;
- (int)appUsageCountForEntityFromSiriInf;
- (int)appUsageCountForEntityInf;
- (int)recencyOrderOfAppUsageForEntityFromSiri;
- (int)recencyOrderOfAppUsedForEntity;
- (int)taskAbandonCountForEntityInUsingApp10Min;
- (int)taskAbandonCountForEntityInUsingApp14Days;
- (int)taskAbandonCountForEntityInUsingApp1Day;
- (int)taskAbandonCountForEntityInUsingApp1Hr;
- (int)taskAbandonCountForEntityInUsingApp28Days;
- (int)taskAbandonCountForEntityInUsingApp2Min;
- (int)taskAbandonCountForEntityInUsingApp6Hrs;
- (int)taskAbandonCountForEntityInUsingApp7Days;
- (int)taskAbandonCountForEntityInUsingAppInf;
- (int64_t)timeSinceAppUsedForEntityFromSiriInSec;
- (int64_t)timeSinceAppUsedForEntityInSec;
- (unint64_t)hash;
- (void)deleteAppUsageCountForEntity10Min;
- (void)deleteAppUsageCountForEntity14Days;
- (void)deleteAppUsageCountForEntity1Day;
- (void)deleteAppUsageCountForEntity1Hr;
- (void)deleteAppUsageCountForEntity28Days;
- (void)deleteAppUsageCountForEntity2Min;
- (void)deleteAppUsageCountForEntity6Hrs;
- (void)deleteAppUsageCountForEntity7Days;
- (void)deleteAppUsageCountForEntityFromSiri10Min;
- (void)deleteAppUsageCountForEntityFromSiri14Days;
- (void)deleteAppUsageCountForEntityFromSiri1Day;
- (void)deleteAppUsageCountForEntityFromSiri1Hr;
- (void)deleteAppUsageCountForEntityFromSiri28Days;
- (void)deleteAppUsageCountForEntityFromSiri2Min;
- (void)deleteAppUsageCountForEntityFromSiri6Hrs;
- (void)deleteAppUsageCountForEntityFromSiri7Days;
- (void)deleteAppUsageCountForEntityFromSiriInf;
- (void)deleteAppUsageCountForEntityInf;
- (void)deleteRecencyOrderOfAppUsageForEntityFromSiri;
- (void)deleteRecencyOrderOfAppUsedForEntity;
- (void)deleteTaskAbandonCountForEntityInUsingApp10Min;
- (void)deleteTaskAbandonCountForEntityInUsingApp14Days;
- (void)deleteTaskAbandonCountForEntityInUsingApp1Day;
- (void)deleteTaskAbandonCountForEntityInUsingApp1Hr;
- (void)deleteTaskAbandonCountForEntityInUsingApp28Days;
- (void)deleteTaskAbandonCountForEntityInUsingApp2Min;
- (void)deleteTaskAbandonCountForEntityInUsingApp6Hrs;
- (void)deleteTaskAbandonCountForEntityInUsingApp7Days;
- (void)deleteTaskAbandonCountForEntityInUsingAppInf;
- (void)deleteTimeSinceAppUsedForEntityFromSiriInSec;
- (void)deleteTimeSinceAppUsedForEntityInSec;
- (void)setAppUsageCountForEntity10Min:(int)a3;
- (void)setAppUsageCountForEntity14Days:(int)a3;
- (void)setAppUsageCountForEntity1Day:(int)a3;
- (void)setAppUsageCountForEntity1Hr:(int)a3;
- (void)setAppUsageCountForEntity28Days:(int)a3;
- (void)setAppUsageCountForEntity2Min:(int)a3;
- (void)setAppUsageCountForEntity6Hrs:(int)a3;
- (void)setAppUsageCountForEntity7Days:(int)a3;
- (void)setAppUsageCountForEntityFromSiri10Min:(int)a3;
- (void)setAppUsageCountForEntityFromSiri14Days:(int)a3;
- (void)setAppUsageCountForEntityFromSiri1Day:(int)a3;
- (void)setAppUsageCountForEntityFromSiri1Hr:(int)a3;
- (void)setAppUsageCountForEntityFromSiri28Days:(int)a3;
- (void)setAppUsageCountForEntityFromSiri2Min:(int)a3;
- (void)setAppUsageCountForEntityFromSiri6Hrs:(int)a3;
- (void)setAppUsageCountForEntityFromSiri7Days:(int)a3;
- (void)setAppUsageCountForEntityFromSiriInf:(int)a3;
- (void)setAppUsageCountForEntityInf:(int)a3;
- (void)setHasAppUsageCountForEntity10Min:(BOOL)a3;
- (void)setHasAppUsageCountForEntity14Days:(BOOL)a3;
- (void)setHasAppUsageCountForEntity1Day:(BOOL)a3;
- (void)setHasAppUsageCountForEntity1Hr:(BOOL)a3;
- (void)setHasAppUsageCountForEntity28Days:(BOOL)a3;
- (void)setHasAppUsageCountForEntity2Min:(BOOL)a3;
- (void)setHasAppUsageCountForEntity6Hrs:(BOOL)a3;
- (void)setHasAppUsageCountForEntity7Days:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiri10Min:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiri14Days:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiri1Day:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiri1Hr:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiri28Days:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiri2Min:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiri6Hrs:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiri7Days:(BOOL)a3;
- (void)setHasAppUsageCountForEntityFromSiriInf:(BOOL)a3;
- (void)setHasAppUsageCountForEntityInf:(BOOL)a3;
- (void)setHasRecencyOrderOfAppUsageForEntityFromSiri:(BOOL)a3;
- (void)setHasRecencyOrderOfAppUsedForEntity:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingApp10Min:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingApp14Days:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingApp1Day:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingApp1Hr:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingApp28Days:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingApp2Min:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingApp6Hrs:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingApp7Days:(BOOL)a3;
- (void)setHasTaskAbandonCountForEntityInUsingAppInf:(BOOL)a3;
- (void)setHasTimeSinceAppUsedForEntityFromSiriInSec:(BOOL)a3;
- (void)setHasTimeSinceAppUsedForEntityInSec:(BOOL)a3;
- (void)setRecencyOrderOfAppUsageForEntityFromSiri:(int)a3;
- (void)setRecencyOrderOfAppUsedForEntity:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingApp10Min:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingApp14Days:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingApp1Day:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingApp1Hr:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingApp28Days:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingApp2Min:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingApp6Hrs:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingApp7Days:(int)a3;
- (void)setTaskAbandonCountForEntityInUsingAppInf:(int)a3;
- (void)setTimeSinceAppUsedForEntityFromSiriInSec:(int64_t)a3;
- (void)setTimeSinceAppUsedForEntityInSec:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)taskAbandonCountForEntityInUsingAppInf
{
  return self->_taskAbandonCountForEntityInUsingAppInf;
}

- (int)taskAbandonCountForEntityInUsingApp28Days
{
  return self->_taskAbandonCountForEntityInUsingApp28Days;
}

- (int)taskAbandonCountForEntityInUsingApp14Days
{
  return self->_taskAbandonCountForEntityInUsingApp14Days;
}

- (int)taskAbandonCountForEntityInUsingApp7Days
{
  return self->_taskAbandonCountForEntityInUsingApp7Days;
}

- (int)taskAbandonCountForEntityInUsingApp1Day
{
  return self->_taskAbandonCountForEntityInUsingApp1Day;
}

- (int)taskAbandonCountForEntityInUsingApp6Hrs
{
  return self->_taskAbandonCountForEntityInUsingApp6Hrs;
}

- (int)taskAbandonCountForEntityInUsingApp1Hr
{
  return self->_taskAbandonCountForEntityInUsingApp1Hr;
}

- (int)taskAbandonCountForEntityInUsingApp10Min
{
  return self->_taskAbandonCountForEntityInUsingApp10Min;
}

- (int)taskAbandonCountForEntityInUsingApp2Min
{
  return self->_taskAbandonCountForEntityInUsingApp2Min;
}

- (int64_t)timeSinceAppUsedForEntityFromSiriInSec
{
  return self->_timeSinceAppUsedForEntityFromSiriInSec;
}

- (int)recencyOrderOfAppUsageForEntityFromSiri
{
  return self->_recencyOrderOfAppUsageForEntityFromSiri;
}

- (int)appUsageCountForEntityFromSiriInf
{
  return self->_appUsageCountForEntityFromSiriInf;
}

- (int)appUsageCountForEntityFromSiri28Days
{
  return self->_appUsageCountForEntityFromSiri28Days;
}

- (int)appUsageCountForEntityFromSiri14Days
{
  return self->_appUsageCountForEntityFromSiri14Days;
}

- (int)appUsageCountForEntityFromSiri7Days
{
  return self->_appUsageCountForEntityFromSiri7Days;
}

- (int)appUsageCountForEntityFromSiri1Day
{
  return self->_appUsageCountForEntityFromSiri1Day;
}

- (int)appUsageCountForEntityFromSiri6Hrs
{
  return self->_appUsageCountForEntityFromSiri6Hrs;
}

- (int)appUsageCountForEntityFromSiri1Hr
{
  return self->_appUsageCountForEntityFromSiri1Hr;
}

- (int)appUsageCountForEntityFromSiri10Min
{
  return self->_appUsageCountForEntityFromSiri10Min;
}

- (int)appUsageCountForEntityFromSiri2Min
{
  return self->_appUsageCountForEntityFromSiri2Min;
}

- (int64_t)timeSinceAppUsedForEntityInSec
{
  return self->_timeSinceAppUsedForEntityInSec;
}

- (int)recencyOrderOfAppUsedForEntity
{
  return self->_recencyOrderOfAppUsedForEntity;
}

- (int)appUsageCountForEntityInf
{
  return self->_appUsageCountForEntityInf;
}

- (int)appUsageCountForEntity28Days
{
  return self->_appUsageCountForEntity28Days;
}

- (int)appUsageCountForEntity14Days
{
  return self->_appUsageCountForEntity14Days;
}

- (int)appUsageCountForEntity7Days
{
  return self->_appUsageCountForEntity7Days;
}

- (int)appUsageCountForEntity1Day
{
  return self->_appUsageCountForEntity1Day;
}

- (int)appUsageCountForEntity6Hrs
{
  return self->_appUsageCountForEntity6Hrs;
}

- (int)appUsageCountForEntity1Hr
{
  return self->_appUsageCountForEntity1Hr;
}

- (int)appUsageCountForEntity10Min
{
  return self->_appUsageCountForEntity10Min;
}

- (int)appUsageCountForEntity2Min
{
  return self->_appUsageCountForEntity2Min;
}

- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals;
  v5 = [(INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals *)&v68 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appUsageCountForEntity2Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity2Min:](v5, "setAppUsageCountForEntity2Min:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"appUsageCountForEntity10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity10Min:](v5, "setAppUsageCountForEntity10Min:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"appUsageCountForEntity1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity1Hr:](v5, "setAppUsageCountForEntity1Hr:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"appUsageCountForEntity6Hrs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity6Hrs:](v5, "setAppUsageCountForEntity6Hrs:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appUsageCountForEntity1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity1Day:](v5, "setAppUsageCountForEntity1Day:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"appUsageCountForEntity7Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity7Days:](v5, "setAppUsageCountForEntity7Days:", [v11 intValue]);
    }
    v57 = v6;
    v12 = [v4 objectForKeyedSubscript:@"appUsageCountForEntity14Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity14Days:](v5, "setAppUsageCountForEntity14Days:", [v12 intValue]);
    }
    v51 = v12;
    v13 = [v4 objectForKeyedSubscript:@"appUsageCountForEntity28Days"];
    objc_opt_class();
    v67 = v13;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntity28Days:](v5, "setAppUsageCountForEntity28Days:", [v13 intValue]);
    }
    v14 = v10;
    v56 = v7;
    v15 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityInf:](v5, "setAppUsageCountForEntityInf:", [v15 intValue]);
    }
    v16 = v9;
    v17 = [v4 objectForKeyedSubscript:@"recencyOrderOfAppUsedForEntity"];
    objc_opt_class();
    v66 = v17;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setRecencyOrderOfAppUsedForEntity:](v5, "setRecencyOrderOfAppUsedForEntity:", [v17 intValue]);
    }
    v18 = v8;
    v19 = [v4 objectForKeyedSubscript:@"timeSinceAppUsedForEntityInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTimeSinceAppUsedForEntityInSec:](v5, "setTimeSinceAppUsedForEntityInSec:", [v19 longLongValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiri2Min"];
    objc_opt_class();
    v65 = v20;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri2Min:](v5, "setAppUsageCountForEntityFromSiri2Min:", [v20 intValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiri10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri10Min:](v5, "setAppUsageCountForEntityFromSiri10Min:", [v21 intValue]);
    }
    v48 = v21;
    v22 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiri1Hr"];
    objc_opt_class();
    v64 = v22;
    v55 = v18;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri1Hr:](v5, "setAppUsageCountForEntityFromSiri1Hr:", [v22 intValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiri6Hrs"];
    objc_opt_class();
    v63 = v23;
    v54 = v16;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri6Hrs:](v5, "setAppUsageCountForEntityFromSiri6Hrs:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiri1Day"];
    objc_opt_class();
    v62 = v24;
    v53 = v14;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri1Day:](v5, "setAppUsageCountForEntityFromSiri1Day:", [v24 intValue]);
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiri7Days"];
    objc_opt_class();
    v61 = (void *)v25;
    v26 = v11;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri7Days:](v5, "setAppUsageCountForEntityFromSiri7Days:", [v61 intValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiri14Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri14Days:](v5, "setAppUsageCountForEntityFromSiri14Days:", [v27 intValue]);
    }
    v28 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiri28Days"];
    objc_opt_class();
    v60 = v28;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiri28Days:](v5, "setAppUsageCountForEntityFromSiri28Days:", [v28 intValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"appUsageCountForEntityFromSiriInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setAppUsageCountForEntityFromSiriInf:](v5, "setAppUsageCountForEntityFromSiriInf:", [v29 intValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"recencyOrderOfAppUsageForEntityFromSiri"];
    objc_opt_class();
    v59 = v30;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setRecencyOrderOfAppUsageForEntityFromSiri:](v5, "setRecencyOrderOfAppUsageForEntityFromSiri:", [v30 intValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"timeSinceAppUsedForEntityFromSiriInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTimeSinceAppUsedForEntityFromSiriInSec:](v5, "setTimeSinceAppUsedForEntityFromSiriInSec:", [v31 longLongValue]);
    }
    v32 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingApp2Min"];
    objc_opt_class();
    v58 = v32;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp2Min:](v5, "setTaskAbandonCountForEntityInUsingApp2Min:", [v32 intValue]);
    }
    v50 = v15;
    v33 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingApp10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp10Min:](v5, "setTaskAbandonCountForEntityInUsingApp10Min:", [v33 intValue]);
    }
    v49 = v19;
    v34 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingApp1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp1Hr:](v5, "setTaskAbandonCountForEntityInUsingApp1Hr:", [v34 intValue]);
    }
    v44 = v34;
    v47 = v29;
    v35 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingApp6Hrs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp6Hrs:](v5, "setTaskAbandonCountForEntityInUsingApp6Hrs:", [v35 intValue]);
    }
    v46 = v31;
    v36 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingApp1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp1Day:](v5, "setTaskAbandonCountForEntityInUsingApp1Day:", [v36 intValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingApp7Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp7Days:](v5, "setTaskAbandonCountForEntityInUsingApp7Days:", [v37 intValue]);
    }
    v45 = v33;
    v52 = v26;
    v38 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingApp14Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp14Days:](v5, "setTaskAbandonCountForEntityInUsingApp14Days:", [v38 intValue]);
    }
    v39 = v27;
    v40 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingApp28Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingApp28Days:](v5, "setTaskAbandonCountForEntityInUsingApp28Days:", [v40 intValue]);
    }
    v41 = [v4 objectForKeyedSubscript:@"taskAbandonCountForEntityInUsingAppInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals setTaskAbandonCountForEntityInUsingAppInf:](v5, "setTaskAbandonCountForEntityInUsingAppInf:", [v41 intValue]);
    }
    v42 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals *)self dictionaryRepresentation];
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
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity10Min](self, "appUsageCountForEntity10Min"));
    [v3 setObject:v7 forKeyedSubscript:@"appUsageCountForEntity10Min"];

    $9375210CE62556719FB562F58417832B has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity14Days](self, "appUsageCountForEntity14Days"));
  [v3 setObject:v8 forKeyedSubscript:@"appUsageCountForEntity14Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity1Day](self, "appUsageCountForEntity1Day"));
  [v3 setObject:v9 forKeyedSubscript:@"appUsageCountForEntity1Day"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity1Hr](self, "appUsageCountForEntity1Hr"));
  [v3 setObject:v10 forKeyedSubscript:@"appUsageCountForEntity1Hr"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity28Days](self, "appUsageCountForEntity28Days"));
  [v3 setObject:v11 forKeyedSubscript:@"appUsageCountForEntity28Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity2Min](self, "appUsageCountForEntity2Min"));
  [v3 setObject:v12 forKeyedSubscript:@"appUsageCountForEntity2Min"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity6Hrs](self, "appUsageCountForEntity6Hrs"));
  [v3 setObject:v13 forKeyedSubscript:@"appUsageCountForEntity6Hrs"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntity7Days](self, "appUsageCountForEntity7Days"));
  [v3 setObject:v14 forKeyedSubscript:@"appUsageCountForEntity7Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri10Min](self, "appUsageCountForEntityFromSiri10Min"));
  [v3 setObject:v15 forKeyedSubscript:@"appUsageCountForEntityFromSiri10Min"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri14Days](self, "appUsageCountForEntityFromSiri14Days"));
  [v3 setObject:v16 forKeyedSubscript:@"appUsageCountForEntityFromSiri14Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  v17 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri1Day](self, "appUsageCountForEntityFromSiri1Day"));
  [v3 setObject:v17 forKeyedSubscript:@"appUsageCountForEntityFromSiri1Day"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  v18 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri1Hr](self, "appUsageCountForEntityFromSiri1Hr"));
  [v3 setObject:v18 forKeyedSubscript:@"appUsageCountForEntityFromSiri1Hr"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  v19 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri28Days](self, "appUsageCountForEntityFromSiri28Days"));
  [v3 setObject:v19 forKeyedSubscript:@"appUsageCountForEntityFromSiri28Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri2Min](self, "appUsageCountForEntityFromSiri2Min"));
  [v3 setObject:v20 forKeyedSubscript:@"appUsageCountForEntityFromSiri2Min"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri6Hrs](self, "appUsageCountForEntityFromSiri6Hrs"));
  [v3 setObject:v21 forKeyedSubscript:@"appUsageCountForEntityFromSiri6Hrs"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiri7Days](self, "appUsageCountForEntityFromSiri7Days"));
  [v3 setObject:v22 forKeyedSubscript:@"appUsageCountForEntityFromSiri7Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  v23 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityFromSiriInf](self, "appUsageCountForEntityFromSiriInf"));
  [v3 setObject:v23 forKeyedSubscript:@"appUsageCountForEntityFromSiriInf"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  v24 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals appUsageCountForEntityInf](self, "appUsageCountForEntityInf"));
  [v3 setObject:v24 forKeyedSubscript:@"appUsageCountForEntityInf"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals recencyOrderOfAppUsageForEntityFromSiri](self, "recencyOrderOfAppUsageForEntityFromSiri"));
  [v3 setObject:v25 forKeyedSubscript:@"recencyOrderOfAppUsageForEntityFromSiri"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_56;
  }
LABEL_55:
  v26 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals recencyOrderOfAppUsedForEntity](self, "recencyOrderOfAppUsedForEntity"));
  [v3 setObject:v26 forKeyedSubscript:@"recencyOrderOfAppUsedForEntity"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_57;
  }
LABEL_56:
  v27 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp10Min](self, "taskAbandonCountForEntityInUsingApp10Min"));
  [v3 setObject:v27 forKeyedSubscript:@"taskAbandonCountForEntityInUsingApp10Min"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_58;
  }
LABEL_57:
  v28 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp14Days](self, "taskAbandonCountForEntityInUsingApp14Days"));
  [v3 setObject:v28 forKeyedSubscript:@"taskAbandonCountForEntityInUsingApp14Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_59;
  }
LABEL_58:
  v29 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp1Day](self, "taskAbandonCountForEntityInUsingApp1Day"));
  [v3 setObject:v29 forKeyedSubscript:@"taskAbandonCountForEntityInUsingApp1Day"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_60;
  }
LABEL_59:
  v30 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp1Hr](self, "taskAbandonCountForEntityInUsingApp1Hr"));
  [v3 setObject:v30 forKeyedSubscript:@"taskAbandonCountForEntityInUsingApp1Hr"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }
LABEL_60:
  v31 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp28Days](self, "taskAbandonCountForEntityInUsingApp28Days"));
  [v3 setObject:v31 forKeyedSubscript:@"taskAbandonCountForEntityInUsingApp28Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }
LABEL_61:
  v32 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp2Min](self, "taskAbandonCountForEntityInUsingApp2Min"));
  [v3 setObject:v32 forKeyedSubscript:@"taskAbandonCountForEntityInUsingApp2Min"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_63;
  }
LABEL_62:
  v33 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp6Hrs](self, "taskAbandonCountForEntityInUsingApp6Hrs"));
  [v3 setObject:v33 forKeyedSubscript:@"taskAbandonCountForEntityInUsingApp6Hrs"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  v34 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingApp7Days](self, "taskAbandonCountForEntityInUsingApp7Days"));
  [v3 setObject:v34 forKeyedSubscript:@"taskAbandonCountForEntityInUsingApp7Days"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  v35 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals taskAbandonCountForEntityInUsingAppInf](self, "taskAbandonCountForEntityInUsingAppInf"));
  [v3 setObject:v35 forKeyedSubscript:@"taskAbandonCountForEntityInUsingAppInf"];

  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_65:
  v36 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals timeSinceAppUsedForEntityFromSiriInSec](self, "timeSinceAppUsedForEntityFromSiriInSec"));
  [v3 setObject:v36 forKeyedSubscript:@"timeSinceAppUsedForEntityFromSiriInSec"];

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_32:
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignals timeSinceAppUsedForEntityInSec](self, "timeSinceAppUsedForEntityInSec"));
    [v3 setObject:v5 forKeyedSubscript:@"timeSinceAppUsedForEntityInSec"];
  }
LABEL_33:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  $9375210CE62556719FB562F58417832B has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t v34 = 2654435761 * self->_appUsageCountForEntity2Min;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v33 = 2654435761 * self->_appUsageCountForEntity10Min;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v33 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_4:
    uint64_t v32 = 2654435761 * self->_appUsageCountForEntity1Hr;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v32 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_5:
    uint64_t v31 = 2654435761 * self->_appUsageCountForEntity6Hrs;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v31 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v30 = 2654435761 * self->_appUsageCountForEntity1Day;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v30 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v3 = 2654435761 * self->_appUsageCountForEntity7Days;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v3 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v4 = 2654435761 * self->_appUsageCountForEntity14Days;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v5 = 2654435761 * self->_appUsageCountForEntity28Days;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v6 = 2654435761 * self->_appUsageCountForEntityInf;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v7 = 2654435761 * self->_recencyOrderOfAppUsedForEntity;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v8 = 2654435761 * self->_timeSinceAppUsedForEntityInSec;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v9 = 2654435761 * self->_appUsageCountForEntityFromSiri2Min;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v10 = 2654435761 * self->_appUsageCountForEntityFromSiri10Min;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v11 = 2654435761 * self->_appUsageCountForEntityFromSiri1Hr;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v12 = 2654435761 * self->_appUsageCountForEntityFromSiri6Hrs;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v13 = 2654435761 * self->_appUsageCountForEntityFromSiri1Day;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_18:
    uint64_t v14 = 2654435761 * self->_appUsageCountForEntityFromSiri7Days;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v15 = 2654435761 * self->_appUsageCountForEntityFromSiri14Days;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    uint64_t v16 = 2654435761 * self->_appUsageCountForEntityFromSiri28Days;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_21:
    uint64_t v17 = 2654435761 * self->_appUsageCountForEntityFromSiriInf;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_22:
    uint64_t v18 = 2654435761 * self->_recencyOrderOfAppUsageForEntityFromSiri;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_23:
    uint64_t v19 = 2654435761 * self->_timeSinceAppUsedForEntityFromSiriInSec;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_24:
    uint64_t v20 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp2Min;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_25:
    uint64_t v21 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp10Min;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_26:
    uint64_t v22 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp1Hr;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_27:
    uint64_t v23 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp6Hrs;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_28:
    uint64_t v24 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp1Day;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_29:
    uint64_t v25 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp7Days;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_30:
    uint64_t v26 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp14Days;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_31;
    }
LABEL_62:
    uint64_t v27 = 0;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_32;
    }
LABEL_63:
    uint64_t v28 = 0;
    return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_61:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0) {
    goto LABEL_62;
  }
LABEL_31:
  uint64_t v27 = 2654435761 * self->_taskAbandonCountForEntityInUsingApp28Days;
  if ((*(_DWORD *)&has & 0x40000000) == 0) {
    goto LABEL_63;
  }
LABEL_32:
  uint64_t v28 = 2654435761 * self->_taskAbandonCountForEntityInUsingAppInf;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_126;
  }
  $9375210CE62556719FB562F58417832B has = self->_has;
  unsigned int v6 = v4[35];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_126;
  }
  if (*(unsigned char *)&has)
  {
    int appUsageCountForEntity2Min = self->_appUsageCountForEntity2Min;
    if (appUsageCountForEntity2Min != [v4 appUsageCountForEntity2Min]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_126;
  }
  if (v8)
  {
    int appUsageCountForEntity10Min = self->_appUsageCountForEntity10Min;
    if (appUsageCountForEntity10Min != [v4 appUsageCountForEntity10Min]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_126;
  }
  if (v10)
  {
    int appUsageCountForEntity1Hr = self->_appUsageCountForEntity1Hr;
    if (appUsageCountForEntity1Hr != [v4 appUsageCountForEntity1Hr]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_126;
  }
  if (v12)
  {
    int appUsageCountForEntity6Hrs = self->_appUsageCountForEntity6Hrs;
    if (appUsageCountForEntity6Hrs != [v4 appUsageCountForEntity6Hrs]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_126;
  }
  if (v14)
  {
    int appUsageCountForEntity1Day = self->_appUsageCountForEntity1Day;
    if (appUsageCountForEntity1Day != [v4 appUsageCountForEntity1Day]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_126;
  }
  if (v16)
  {
    int appUsageCountForEntity7Days = self->_appUsageCountForEntity7Days;
    if (appUsageCountForEntity7Days != [v4 appUsageCountForEntity7Days]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_126;
  }
  if (v18)
  {
    int appUsageCountForEntity14Days = self->_appUsageCountForEntity14Days;
    if (appUsageCountForEntity14Days != [v4 appUsageCountForEntity14Days]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_126;
  }
  if (v20)
  {
    int appUsageCountForEntity28Days = self->_appUsageCountForEntity28Days;
    if (appUsageCountForEntity28Days != [v4 appUsageCountForEntity28Days]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_126;
  }
  if (v22)
  {
    int appUsageCountForEntityInf = self->_appUsageCountForEntityInf;
    if (appUsageCountForEntityInf != [v4 appUsageCountForEntityInf]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_126;
  }
  if (v24)
  {
    int recencyOrderOfAppUsedForEntity = self->_recencyOrderOfAppUsedForEntity;
    if (recencyOrderOfAppUsedForEntity != [v4 recencyOrderOfAppUsedForEntity]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_126;
  }
  if (v26)
  {
    int64_t timeSinceAppUsedForEntityInSec = self->_timeSinceAppUsedForEntityInSec;
    if (timeSinceAppUsedForEntityInSec != [v4 timeSinceAppUsedForEntityInSec]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1)) {
    goto LABEL_126;
  }
  if (v28)
  {
    int appUsageCountForEntityFromSiri2Min = self->_appUsageCountForEntityFromSiri2Min;
    if (appUsageCountForEntityFromSiri2Min != [v4 appUsageCountForEntityFromSiri2Min]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1)) {
    goto LABEL_126;
  }
  if (v30)
  {
    int appUsageCountForEntityFromSiri10Min = self->_appUsageCountForEntityFromSiri10Min;
    if (appUsageCountForEntityFromSiri10Min != [v4 appUsageCountForEntityFromSiri10Min]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1)) {
    goto LABEL_126;
  }
  if (v32)
  {
    int appUsageCountForEntityFromSiri1Hr = self->_appUsageCountForEntityFromSiri1Hr;
    if (appUsageCountForEntityFromSiri1Hr != [v4 appUsageCountForEntityFromSiri1Hr]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v34 = (*(unsigned int *)&has >> 14) & 1;
  if (v34 != ((v6 >> 14) & 1)) {
    goto LABEL_126;
  }
  if (v34)
  {
    int appUsageCountForEntityFromSiri6Hrs = self->_appUsageCountForEntityFromSiri6Hrs;
    if (appUsageCountForEntityFromSiri6Hrs != [v4 appUsageCountForEntityFromSiri6Hrs]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v36 = (*(unsigned int *)&has >> 15) & 1;
  if (v36 != ((v6 >> 15) & 1)) {
    goto LABEL_126;
  }
  if (v36)
  {
    int appUsageCountForEntityFromSiri1Day = self->_appUsageCountForEntityFromSiri1Day;
    if (appUsageCountForEntityFromSiri1Day != [v4 appUsageCountForEntityFromSiri1Day]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v38 = HIWORD(*(unsigned int *)&has) & 1;
  if (v38 != (HIWORD(v6) & 1)) {
    goto LABEL_126;
  }
  if (v38)
  {
    int appUsageCountForEntityFromSiri7Days = self->_appUsageCountForEntityFromSiri7Days;
    if (appUsageCountForEntityFromSiri7Days != [v4 appUsageCountForEntityFromSiri7Days]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v40 = (*(unsigned int *)&has >> 17) & 1;
  if (v40 != ((v6 >> 17) & 1)) {
    goto LABEL_126;
  }
  if (v40)
  {
    int appUsageCountForEntityFromSiri14Days = self->_appUsageCountForEntityFromSiri14Days;
    if (appUsageCountForEntityFromSiri14Days != [v4 appUsageCountForEntityFromSiri14Days]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v42 = (*(unsigned int *)&has >> 18) & 1;
  if (v42 != ((v6 >> 18) & 1)) {
    goto LABEL_126;
  }
  if (v42)
  {
    int appUsageCountForEntityFromSiri28Days = self->_appUsageCountForEntityFromSiri28Days;
    if (appUsageCountForEntityFromSiri28Days != [v4 appUsageCountForEntityFromSiri28Days]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v44 = (*(unsigned int *)&has >> 19) & 1;
  if (v44 != ((v6 >> 19) & 1)) {
    goto LABEL_126;
  }
  if (v44)
  {
    int appUsageCountForEntityFromSiriInf = self->_appUsageCountForEntityFromSiriInf;
    if (appUsageCountForEntityFromSiriInf != [v4 appUsageCountForEntityFromSiriInf]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v46 = (*(unsigned int *)&has >> 20) & 1;
  if (v46 != ((v6 >> 20) & 1)) {
    goto LABEL_126;
  }
  if (v46)
  {
    int recencyOrderOfAppUsageForEntityFromSiri = self->_recencyOrderOfAppUsageForEntityFromSiri;
    if (recencyOrderOfAppUsageForEntityFromSiri != [v4 recencyOrderOfAppUsageForEntityFromSiri])goto LABEL_126; {
    $9375210CE62556719FB562F58417832B has = self->_has;
    }
    unsigned int v6 = v4[35];
  }
  int v48 = (*(unsigned int *)&has >> 21) & 1;
  if (v48 != ((v6 >> 21) & 1)) {
    goto LABEL_126;
  }
  if (v48)
  {
    int64_t timeSinceAppUsedForEntityFromSiriInSec = self->_timeSinceAppUsedForEntityFromSiriInSec;
    if (timeSinceAppUsedForEntityFromSiriInSec != [v4 timeSinceAppUsedForEntityFromSiriInSec]) {
      goto LABEL_126;
    }
    $9375210CE62556719FB562F58417832B has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v50 = (*(unsigned int *)&has >> 22) & 1;
  if (v50 != ((v6 >> 22) & 1)) {
    goto LABEL_126;
  }
  if (v50)
  {
    int taskAbandonCountForEntityInUsingApp2Min = self->_taskAbandonCountForEntityInUsingApp2Min;
    if (taskAbandonCountForEntityInUsingApp2Min != [v4 taskAbandonCountForEntityInUsingApp2Min])goto LABEL_126; {
    $9375210CE62556719FB562F58417832B has = self->_has;
    }
    unsigned int v6 = v4[35];
  }
  int v52 = (*(unsigned int *)&has >> 23) & 1;
  if (v52 != ((v6 >> 23) & 1)) {
    goto LABEL_126;
  }
  if (v52)
  {
    int taskAbandonCountForEntityInUsingApp10Min = self->_taskAbandonCountForEntityInUsingApp10Min;
    if (taskAbandonCountForEntityInUsingApp10Min != [v4 taskAbandonCountForEntityInUsingApp10Min])goto LABEL_126; {
    $9375210CE62556719FB562F58417832B has = self->_has;
    }
    unsigned int v6 = v4[35];
  }
  int v54 = HIBYTE(*(unsigned int *)&has) & 1;
  if (v54 != (HIBYTE(v6) & 1)) {
    goto LABEL_126;
  }
  if (v54)
  {
    int taskAbandonCountForEntityInUsingApp1Hr = self->_taskAbandonCountForEntityInUsingApp1Hr;
    if (taskAbandonCountForEntityInUsingApp1Hr != [v4 taskAbandonCountForEntityInUsingApp1Hr])goto LABEL_126; {
    $9375210CE62556719FB562F58417832B has = self->_has;
    }
    unsigned int v6 = v4[35];
  }
  int v56 = (*(unsigned int *)&has >> 25) & 1;
  if (v56 != ((v6 >> 25) & 1)) {
    goto LABEL_126;
  }
  if (v56)
  {
    int taskAbandonCountForEntityInUsingApp6Hrs = self->_taskAbandonCountForEntityInUsingApp6Hrs;
    if (taskAbandonCountForEntityInUsingApp6Hrs != [v4 taskAbandonCountForEntityInUsingApp6Hrs])goto LABEL_126; {
    $9375210CE62556719FB562F58417832B has = self->_has;
    }
    unsigned int v6 = v4[35];
  }
  int v58 = (*(unsigned int *)&has >> 26) & 1;
  if (v58 != ((v6 >> 26) & 1)) {
    goto LABEL_126;
  }
  if (v58)
  {
    int taskAbandonCountForEntityInUsingApp1Day = self->_taskAbandonCountForEntityInUsingApp1Day;
    if (taskAbandonCountForEntityInUsingApp1Day != [v4 taskAbandonCountForEntityInUsingApp1Day])goto LABEL_126; {
    $9375210CE62556719FB562F58417832B has = self->_has;
    }
    unsigned int v6 = v4[35];
  }
  int v60 = (*(unsigned int *)&has >> 27) & 1;
  if (v60 != ((v6 >> 27) & 1)) {
    goto LABEL_126;
  }
  if (v60)
  {
    int taskAbandonCountForEntityInUsingApp7Days = self->_taskAbandonCountForEntityInUsingApp7Days;
    if (taskAbandonCountForEntityInUsingApp7Days != [v4 taskAbandonCountForEntityInUsingApp7Days])goto LABEL_126; {
    $9375210CE62556719FB562F58417832B has = self->_has;
    }
    unsigned int v6 = v4[35];
  }
  int v62 = (*(unsigned int *)&has >> 28) & 1;
  if (v62 != ((v6 >> 28) & 1)) {
    goto LABEL_126;
  }
  if (v62)
  {
    int taskAbandonCountForEntityInUsingApp14Days = self->_taskAbandonCountForEntityInUsingApp14Days;
    if (taskAbandonCountForEntityInUsingApp14Days != [v4 taskAbandonCountForEntityInUsingApp14Days])goto LABEL_126; {
    $9375210CE62556719FB562F58417832B has = self->_has;
    }
    unsigned int v6 = v4[35];
  }
  int v64 = (*(unsigned int *)&has >> 29) & 1;
  if (v64 != ((v6 >> 29) & 1)) {
    goto LABEL_126;
  }
  if (v64)
  {
    int taskAbandonCountForEntityInUsingApp28Days = self->_taskAbandonCountForEntityInUsingApp28Days;
    if (taskAbandonCountForEntityInUsingApp28Days == [v4 taskAbandonCountForEntityInUsingApp28Days])
    {
      $9375210CE62556719FB562F58417832B has = self->_has;
      unsigned int v6 = v4[35];
      goto LABEL_122;
    }
LABEL_126:
    BOOL v68 = 0;
    goto LABEL_127;
  }
LABEL_122:
  int v66 = (*(unsigned int *)&has >> 30) & 1;
  if (v66 != ((v6 >> 30) & 1)) {
    goto LABEL_126;
  }
  if (v66)
  {
    int taskAbandonCountForEntityInUsingAppInf = self->_taskAbandonCountForEntityInUsingAppInf;
    if (taskAbandonCountForEntityInUsingAppInf != [v4 taskAbandonCountForEntityInUsingAppInf])goto LABEL_126; {
  }
    }
  BOOL v68 = 1;
LABEL_127:

  return v68;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $9375210CE62556719FB562F58417832B has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteInt32Field();
    $9375210CE62556719FB562F58417832B has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt64Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt64Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  $9375210CE62556719FB562F58417832B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_65:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x40000000) != 0) {
LABEL_32:
  }
    PBDataWriterWriteInt32Field();
LABEL_33:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommonAppDependentEntityFrequencyAndRecencySignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteTaskAbandonCountForEntityInUsingAppInf
{
  *(_DWORD *)&self->_has &= ~0x40000000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingAppInf:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingAppInf
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTaskAbandonCountForEntityInUsingAppInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_int taskAbandonCountForEntityInUsingAppInf = a3;
}

- (void)deleteTaskAbandonCountForEntityInUsingApp28Days
{
  *(_DWORD *)&self->_has &= ~0x20000000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp28Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp28Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setTaskAbandonCountForEntityInUsingApp28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_int taskAbandonCountForEntityInUsingApp28Days = a3;
}

- (void)deleteTaskAbandonCountForEntityInUsingApp14Days
{
  *(_DWORD *)&self->_has &= ~0x10000000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp14Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp14Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setTaskAbandonCountForEntityInUsingApp14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_int taskAbandonCountForEntityInUsingApp14Days = a3;
}

- (void)deleteTaskAbandonCountForEntityInUsingApp7Days
{
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp7Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp7Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setTaskAbandonCountForEntityInUsingApp7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_int taskAbandonCountForEntityInUsingApp7Days = a3;
}

- (void)deleteTaskAbandonCountForEntityInUsingApp1Day
{
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp1Day:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp1Day
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTaskAbandonCountForEntityInUsingApp1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_int taskAbandonCountForEntityInUsingApp1Day = a3;
}

- (void)deleteTaskAbandonCountForEntityInUsingApp6Hrs
{
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp6Hrs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp6Hrs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTaskAbandonCountForEntityInUsingApp6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_int taskAbandonCountForEntityInUsingApp6Hrs = a3;
}

- (void)deleteTaskAbandonCountForEntityInUsingApp1Hr
{
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp1Hr:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp1Hr
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setTaskAbandonCountForEntityInUsingApp1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_int taskAbandonCountForEntityInUsingApp1Hr = a3;
}

- (void)deleteTaskAbandonCountForEntityInUsingApp10Min
{
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp10Min:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp10Min
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTaskAbandonCountForEntityInUsingApp10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_int taskAbandonCountForEntityInUsingApp10Min = a3;
}

- (void)deleteTaskAbandonCountForEntityInUsingApp2Min
{
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setHasTaskAbandonCountForEntityInUsingApp2Min:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountForEntityInUsingApp2Min
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setTaskAbandonCountForEntityInUsingApp2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_int taskAbandonCountForEntityInUsingApp2Min = a3;
}

- (void)deleteTimeSinceAppUsedForEntityFromSiriInSec
{
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setHasTimeSinceAppUsedForEntityFromSiriInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTimeSinceAppUsedForEntityFromSiriInSec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTimeSinceAppUsedForEntityFromSiriInSec:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_int64_t timeSinceAppUsedForEntityFromSiriInSec = a3;
}

- (void)deleteRecencyOrderOfAppUsageForEntityFromSiri
{
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setHasRecencyOrderOfAppUsageForEntityFromSiri:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRecencyOrderOfAppUsageForEntityFromSiri
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRecencyOrderOfAppUsageForEntityFromSiri:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_int recencyOrderOfAppUsageForEntityFromSiri = a3;
}

- (void)deleteAppUsageCountForEntityFromSiriInf
{
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setHasAppUsageCountForEntityFromSiriInf:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiriInf
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAppUsageCountForEntityFromSiriInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_int appUsageCountForEntityFromSiriInf = a3;
}

- (void)deleteAppUsageCountForEntityFromSiri28Days
{
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setHasAppUsageCountForEntityFromSiri28Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiri28Days
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setAppUsageCountForEntityFromSiri28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_int appUsageCountForEntityFromSiri28Days = a3;
}

- (void)deleteAppUsageCountForEntityFromSiri14Days
{
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setHasAppUsageCountForEntityFromSiri14Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiri14Days
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAppUsageCountForEntityFromSiri14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_int appUsageCountForEntityFromSiri14Days = a3;
}

- (void)deleteAppUsageCountForEntityFromSiri7Days
{
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setHasAppUsageCountForEntityFromSiri7Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiri7Days
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setAppUsageCountForEntityFromSiri7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_int appUsageCountForEntityFromSiri7Days = a3;
}

- (void)deleteAppUsageCountForEntityFromSiri1Day
{
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setHasAppUsageCountForEntityFromSiri1Day:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiri1Day
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setAppUsageCountForEntityFromSiri1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_int appUsageCountForEntityFromSiri1Day = a3;
}

- (void)deleteAppUsageCountForEntityFromSiri6Hrs
{
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setHasAppUsageCountForEntityFromSiri6Hrs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiri6Hrs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAppUsageCountForEntityFromSiri6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_int appUsageCountForEntityFromSiri6Hrs = a3;
}

- (void)deleteAppUsageCountForEntityFromSiri1Hr
{
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setHasAppUsageCountForEntityFromSiri1Hr:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiri1Hr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setAppUsageCountForEntityFromSiri1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_int appUsageCountForEntityFromSiri1Hr = a3;
}

- (void)deleteAppUsageCountForEntityFromSiri10Min
{
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setHasAppUsageCountForEntityFromSiri10Min:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiri10Min
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setAppUsageCountForEntityFromSiri10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_int appUsageCountForEntityFromSiri10Min = a3;
}

- (void)deleteAppUsageCountForEntityFromSiri2Min
{
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setHasAppUsageCountForEntityFromSiri2Min:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasAppUsageCountForEntityFromSiri2Min
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setAppUsageCountForEntityFromSiri2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_int appUsageCountForEntityFromSiri2Min = a3;
}

- (void)deleteTimeSinceAppUsedForEntityInSec
{
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setHasTimeSinceAppUsedForEntityInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTimeSinceAppUsedForEntityInSec
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTimeSinceAppUsedForEntityInSec:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_int64_t timeSinceAppUsedForEntityInSec = a3;
}

- (void)deleteRecencyOrderOfAppUsedForEntity
{
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setHasRecencyOrderOfAppUsedForEntity:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRecencyOrderOfAppUsedForEntity
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRecencyOrderOfAppUsedForEntity:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_int recencyOrderOfAppUsedForEntity = a3;
}

- (void)deleteAppUsageCountForEntityInf
{
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setHasAppUsageCountForEntityInf:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasAppUsageCountForEntityInf
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setAppUsageCountForEntityInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_int appUsageCountForEntityInf = a3;
}

- (void)deleteAppUsageCountForEntity28Days
{
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setHasAppUsageCountForEntity28Days:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasAppUsageCountForEntity28Days
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setAppUsageCountForEntity28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_int appUsageCountForEntity28Days = a3;
}

- (void)deleteAppUsageCountForEntity14Days
{
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setHasAppUsageCountForEntity14Days:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasAppUsageCountForEntity14Days
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAppUsageCountForEntity14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_int appUsageCountForEntity14Days = a3;
}

- (void)deleteAppUsageCountForEntity7Days
{
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setHasAppUsageCountForEntity7Days:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAppUsageCountForEntity7Days
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAppUsageCountForEntity7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_int appUsageCountForEntity7Days = a3;
}

- (void)deleteAppUsageCountForEntity1Day
{
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setHasAppUsageCountForEntity1Day:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAppUsageCountForEntity1Day
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAppUsageCountForEntity1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_int appUsageCountForEntity1Day = a3;
}

- (void)deleteAppUsageCountForEntity6Hrs
{
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setHasAppUsageCountForEntity6Hrs:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAppUsageCountForEntity6Hrs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppUsageCountForEntity6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_int appUsageCountForEntity6Hrs = a3;
}

- (void)deleteAppUsageCountForEntity1Hr
{
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setHasAppUsageCountForEntity1Hr:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAppUsageCountForEntity1Hr
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAppUsageCountForEntity1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_int appUsageCountForEntity1Hr = a3;
}

- (void)deleteAppUsageCountForEntity10Min
{
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setHasAppUsageCountForEntity10Min:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAppUsageCountForEntity10Min
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppUsageCountForEntity10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_int appUsageCountForEntity10Min = a3;
}

- (void)deleteAppUsageCountForEntity2Min
{
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setHasAppUsageCountForEntity2Min:(BOOL)a3
{
  self->_$9375210CE62556719FB562F58417832B has = ($9375210CE62556719FB562F58417832B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAppUsageCountForEntity2Min
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAppUsageCountForEntity2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_int appUsageCountForEntity2Min = a3;
}

@end