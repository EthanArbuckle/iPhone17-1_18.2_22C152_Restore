@interface INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals
- (BOOL)hasAppUsageCount10Min;
- (BOOL)hasAppUsageCount14Days;
- (BOOL)hasAppUsageCount1Day;
- (BOOL)hasAppUsageCount1Hr;
- (BOOL)hasAppUsageCount28Days;
- (BOOL)hasAppUsageCount2Min;
- (BOOL)hasAppUsageCount6Hrs;
- (BOOL)hasAppUsageCount7Days;
- (BOOL)hasAppUsageCountFromSiri10Min;
- (BOOL)hasAppUsageCountFromSiri14Days;
- (BOOL)hasAppUsageCountFromSiri1Day;
- (BOOL)hasAppUsageCountFromSiri1Hr;
- (BOOL)hasAppUsageCountFromSiri28Days;
- (BOOL)hasAppUsageCountFromSiri2Min;
- (BOOL)hasAppUsageCountFromSiri6Hrs;
- (BOOL)hasAppUsageCountFromSiri7Days;
- (BOOL)hasAppUsageCountFromSiriInf;
- (BOOL)hasAppUsageCountInf;
- (BOOL)hasRecencyOrderOfAppUsageFromSiri;
- (BOOL)hasRecencyOrderOfAppUsed;
- (BOOL)hasTaskAbandonCountInUsingApp10Min;
- (BOOL)hasTaskAbandonCountInUsingApp14Days;
- (BOOL)hasTaskAbandonCountInUsingApp1Day;
- (BOOL)hasTaskAbandonCountInUsingApp1Hr;
- (BOOL)hasTaskAbandonCountInUsingApp28Days;
- (BOOL)hasTaskAbandonCountInUsingApp2Min;
- (BOOL)hasTaskAbandonCountInUsingApp6Hrs;
- (BOOL)hasTaskAbandonCountInUsingApp7Days;
- (BOOL)hasTaskAbandonCountInUsingAppInf;
- (BOOL)hasTimeSinceAppUsedFromSiriInSec;
- (BOOL)hasTimeSinceAppUsedInSec;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appUsageCount10Min;
- (int)appUsageCount14Days;
- (int)appUsageCount1Day;
- (int)appUsageCount1Hr;
- (int)appUsageCount28Days;
- (int)appUsageCount2Min;
- (int)appUsageCount6Hrs;
- (int)appUsageCount7Days;
- (int)appUsageCountFromSiri10Min;
- (int)appUsageCountFromSiri14Days;
- (int)appUsageCountFromSiri1Day;
- (int)appUsageCountFromSiri1Hr;
- (int)appUsageCountFromSiri28Days;
- (int)appUsageCountFromSiri2Min;
- (int)appUsageCountFromSiri6Hrs;
- (int)appUsageCountFromSiri7Days;
- (int)appUsageCountFromSiriInf;
- (int)appUsageCountInf;
- (int)recencyOrderOfAppUsageFromSiri;
- (int)recencyOrderOfAppUsed;
- (int)taskAbandonCountInUsingApp10Min;
- (int)taskAbandonCountInUsingApp14Days;
- (int)taskAbandonCountInUsingApp1Day;
- (int)taskAbandonCountInUsingApp1Hr;
- (int)taskAbandonCountInUsingApp28Days;
- (int)taskAbandonCountInUsingApp2Min;
- (int)taskAbandonCountInUsingApp6Hrs;
- (int)taskAbandonCountInUsingApp7Days;
- (int)taskAbandonCountInUsingAppInf;
- (int64_t)timeSinceAppUsedFromSiriInSec;
- (int64_t)timeSinceAppUsedInSec;
- (unint64_t)hash;
- (void)deleteAppUsageCount10Min;
- (void)deleteAppUsageCount14Days;
- (void)deleteAppUsageCount1Day;
- (void)deleteAppUsageCount1Hr;
- (void)deleteAppUsageCount28Days;
- (void)deleteAppUsageCount2Min;
- (void)deleteAppUsageCount6Hrs;
- (void)deleteAppUsageCount7Days;
- (void)deleteAppUsageCountFromSiri10Min;
- (void)deleteAppUsageCountFromSiri14Days;
- (void)deleteAppUsageCountFromSiri1Day;
- (void)deleteAppUsageCountFromSiri1Hr;
- (void)deleteAppUsageCountFromSiri28Days;
- (void)deleteAppUsageCountFromSiri2Min;
- (void)deleteAppUsageCountFromSiri6Hrs;
- (void)deleteAppUsageCountFromSiri7Days;
- (void)deleteAppUsageCountFromSiriInf;
- (void)deleteAppUsageCountInf;
- (void)deleteRecencyOrderOfAppUsageFromSiri;
- (void)deleteRecencyOrderOfAppUsed;
- (void)deleteTaskAbandonCountInUsingApp10Min;
- (void)deleteTaskAbandonCountInUsingApp14Days;
- (void)deleteTaskAbandonCountInUsingApp1Day;
- (void)deleteTaskAbandonCountInUsingApp1Hr;
- (void)deleteTaskAbandonCountInUsingApp28Days;
- (void)deleteTaskAbandonCountInUsingApp2Min;
- (void)deleteTaskAbandonCountInUsingApp6Hrs;
- (void)deleteTaskAbandonCountInUsingApp7Days;
- (void)deleteTaskAbandonCountInUsingAppInf;
- (void)deleteTimeSinceAppUsedFromSiriInSec;
- (void)deleteTimeSinceAppUsedInSec;
- (void)setAppUsageCount10Min:(int)a3;
- (void)setAppUsageCount14Days:(int)a3;
- (void)setAppUsageCount1Day:(int)a3;
- (void)setAppUsageCount1Hr:(int)a3;
- (void)setAppUsageCount28Days:(int)a3;
- (void)setAppUsageCount2Min:(int)a3;
- (void)setAppUsageCount6Hrs:(int)a3;
- (void)setAppUsageCount7Days:(int)a3;
- (void)setAppUsageCountFromSiri10Min:(int)a3;
- (void)setAppUsageCountFromSiri14Days:(int)a3;
- (void)setAppUsageCountFromSiri1Day:(int)a3;
- (void)setAppUsageCountFromSiri1Hr:(int)a3;
- (void)setAppUsageCountFromSiri28Days:(int)a3;
- (void)setAppUsageCountFromSiri2Min:(int)a3;
- (void)setAppUsageCountFromSiri6Hrs:(int)a3;
- (void)setAppUsageCountFromSiri7Days:(int)a3;
- (void)setAppUsageCountFromSiriInf:(int)a3;
- (void)setAppUsageCountInf:(int)a3;
- (void)setHasAppUsageCount10Min:(BOOL)a3;
- (void)setHasAppUsageCount14Days:(BOOL)a3;
- (void)setHasAppUsageCount1Day:(BOOL)a3;
- (void)setHasAppUsageCount1Hr:(BOOL)a3;
- (void)setHasAppUsageCount28Days:(BOOL)a3;
- (void)setHasAppUsageCount2Min:(BOOL)a3;
- (void)setHasAppUsageCount6Hrs:(BOOL)a3;
- (void)setHasAppUsageCount7Days:(BOOL)a3;
- (void)setHasAppUsageCountFromSiri10Min:(BOOL)a3;
- (void)setHasAppUsageCountFromSiri14Days:(BOOL)a3;
- (void)setHasAppUsageCountFromSiri1Day:(BOOL)a3;
- (void)setHasAppUsageCountFromSiri1Hr:(BOOL)a3;
- (void)setHasAppUsageCountFromSiri28Days:(BOOL)a3;
- (void)setHasAppUsageCountFromSiri2Min:(BOOL)a3;
- (void)setHasAppUsageCountFromSiri6Hrs:(BOOL)a3;
- (void)setHasAppUsageCountFromSiri7Days:(BOOL)a3;
- (void)setHasAppUsageCountFromSiriInf:(BOOL)a3;
- (void)setHasAppUsageCountInf:(BOOL)a3;
- (void)setHasRecencyOrderOfAppUsageFromSiri:(BOOL)a3;
- (void)setHasRecencyOrderOfAppUsed:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingApp10Min:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingApp14Days:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingApp1Day:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingApp1Hr:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingApp28Days:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingApp2Min:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingApp6Hrs:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingApp7Days:(BOOL)a3;
- (void)setHasTaskAbandonCountInUsingAppInf:(BOOL)a3;
- (void)setHasTimeSinceAppUsedFromSiriInSec:(BOOL)a3;
- (void)setHasTimeSinceAppUsedInSec:(BOOL)a3;
- (void)setRecencyOrderOfAppUsageFromSiri:(int)a3;
- (void)setRecencyOrderOfAppUsed:(int)a3;
- (void)setTaskAbandonCountInUsingApp10Min:(int)a3;
- (void)setTaskAbandonCountInUsingApp14Days:(int)a3;
- (void)setTaskAbandonCountInUsingApp1Day:(int)a3;
- (void)setTaskAbandonCountInUsingApp1Hr:(int)a3;
- (void)setTaskAbandonCountInUsingApp28Days:(int)a3;
- (void)setTaskAbandonCountInUsingApp2Min:(int)a3;
- (void)setTaskAbandonCountInUsingApp6Hrs:(int)a3;
- (void)setTaskAbandonCountInUsingApp7Days:(int)a3;
- (void)setTaskAbandonCountInUsingAppInf:(int)a3;
- (void)setTimeSinceAppUsedFromSiriInSec:(int64_t)a3;
- (void)setTimeSinceAppUsedInSec:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)taskAbandonCountInUsingAppInf
{
  return self->_taskAbandonCountInUsingAppInf;
}

- (int)taskAbandonCountInUsingApp28Days
{
  return self->_taskAbandonCountInUsingApp28Days;
}

- (int)taskAbandonCountInUsingApp14Days
{
  return self->_taskAbandonCountInUsingApp14Days;
}

- (int)taskAbandonCountInUsingApp7Days
{
  return self->_taskAbandonCountInUsingApp7Days;
}

- (int)taskAbandonCountInUsingApp1Day
{
  return self->_taskAbandonCountInUsingApp1Day;
}

- (int)taskAbandonCountInUsingApp6Hrs
{
  return self->_taskAbandonCountInUsingApp6Hrs;
}

- (int)taskAbandonCountInUsingApp1Hr
{
  return self->_taskAbandonCountInUsingApp1Hr;
}

- (int)taskAbandonCountInUsingApp10Min
{
  return self->_taskAbandonCountInUsingApp10Min;
}

- (int)taskAbandonCountInUsingApp2Min
{
  return self->_taskAbandonCountInUsingApp2Min;
}

- (int64_t)timeSinceAppUsedFromSiriInSec
{
  return self->_timeSinceAppUsedFromSiriInSec;
}

- (int)recencyOrderOfAppUsageFromSiri
{
  return self->_recencyOrderOfAppUsageFromSiri;
}

- (int)appUsageCountFromSiriInf
{
  return self->_appUsageCountFromSiriInf;
}

- (int)appUsageCountFromSiri28Days
{
  return self->_appUsageCountFromSiri28Days;
}

- (int)appUsageCountFromSiri14Days
{
  return self->_appUsageCountFromSiri14Days;
}

- (int)appUsageCountFromSiri7Days
{
  return self->_appUsageCountFromSiri7Days;
}

- (int)appUsageCountFromSiri1Day
{
  return self->_appUsageCountFromSiri1Day;
}

- (int)appUsageCountFromSiri6Hrs
{
  return self->_appUsageCountFromSiri6Hrs;
}

- (int)appUsageCountFromSiri1Hr
{
  return self->_appUsageCountFromSiri1Hr;
}

- (int)appUsageCountFromSiri10Min
{
  return self->_appUsageCountFromSiri10Min;
}

- (int)appUsageCountFromSiri2Min
{
  return self->_appUsageCountFromSiri2Min;
}

- (int64_t)timeSinceAppUsedInSec
{
  return self->_timeSinceAppUsedInSec;
}

- (int)recencyOrderOfAppUsed
{
  return self->_recencyOrderOfAppUsed;
}

- (int)appUsageCountInf
{
  return self->_appUsageCountInf;
}

- (int)appUsageCount28Days
{
  return self->_appUsageCount28Days;
}

- (int)appUsageCount14Days
{
  return self->_appUsageCount14Days;
}

- (int)appUsageCount7Days
{
  return self->_appUsageCount7Days;
}

- (int)appUsageCount1Day
{
  return self->_appUsageCount1Day;
}

- (int)appUsageCount6Hrs
{
  return self->_appUsageCount6Hrs;
}

- (int)appUsageCount1Hr
{
  return self->_appUsageCount1Hr;
}

- (int)appUsageCount10Min
{
  return self->_appUsageCount10Min;
}

- (int)appUsageCount2Min
{
  return self->_appUsageCount2Min;
}

- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals;
  v5 = [(INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals *)&v68 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appUsageCount2Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount2Min:](v5, "setAppUsageCount2Min:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"appUsageCount10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount10Min:](v5, "setAppUsageCount10Min:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"appUsageCount1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount1Hr:](v5, "setAppUsageCount1Hr:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"appUsageCount6Hrs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount6Hrs:](v5, "setAppUsageCount6Hrs:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appUsageCount1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount1Day:](v5, "setAppUsageCount1Day:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"appUsageCount7Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount7Days:](v5, "setAppUsageCount7Days:", [v11 intValue]);
    }
    v57 = v6;
    v12 = [v4 objectForKeyedSubscript:@"appUsageCount14Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount14Days:](v5, "setAppUsageCount14Days:", [v12 intValue]);
    }
    v51 = v12;
    v13 = [v4 objectForKeyedSubscript:@"appUsageCount28Days"];
    objc_opt_class();
    v67 = v13;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCount28Days:](v5, "setAppUsageCount28Days:", [v13 intValue]);
    }
    v14 = v10;
    v56 = v7;
    v15 = [v4 objectForKeyedSubscript:@"appUsageCountInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountInf:](v5, "setAppUsageCountInf:", [v15 intValue]);
    }
    v16 = v9;
    v17 = [v4 objectForKeyedSubscript:@"recencyOrderOfAppUsed"];
    objc_opt_class();
    v66 = v17;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setRecencyOrderOfAppUsed:](v5, "setRecencyOrderOfAppUsed:", [v17 intValue]);
    }
    v18 = v8;
    v19 = [v4 objectForKeyedSubscript:@"timeSinceAppUsedInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTimeSinceAppUsedInSec:](v5, "setTimeSinceAppUsedInSec:", [v19 longLongValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiri2Min"];
    objc_opt_class();
    v65 = v20;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri2Min:](v5, "setAppUsageCountFromSiri2Min:", [v20 intValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiri10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri10Min:](v5, "setAppUsageCountFromSiri10Min:", [v21 intValue]);
    }
    v48 = v21;
    v22 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiri1Hr"];
    objc_opt_class();
    v64 = v22;
    v55 = v18;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri1Hr:](v5, "setAppUsageCountFromSiri1Hr:", [v22 intValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiri6Hrs"];
    objc_opt_class();
    v63 = v23;
    v54 = v16;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri6Hrs:](v5, "setAppUsageCountFromSiri6Hrs:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiri1Day"];
    objc_opt_class();
    v62 = v24;
    v53 = v14;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri1Day:](v5, "setAppUsageCountFromSiri1Day:", [v24 intValue]);
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiri7Days"];
    objc_opt_class();
    v61 = (void *)v25;
    v26 = v11;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri7Days:](v5, "setAppUsageCountFromSiri7Days:", [v61 intValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiri14Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri14Days:](v5, "setAppUsageCountFromSiri14Days:", [v27 intValue]);
    }
    v28 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiri28Days"];
    objc_opt_class();
    v60 = v28;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiri28Days:](v5, "setAppUsageCountFromSiri28Days:", [v28 intValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"appUsageCountFromSiriInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setAppUsageCountFromSiriInf:](v5, "setAppUsageCountFromSiriInf:", [v29 intValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"recencyOrderOfAppUsageFromSiri"];
    objc_opt_class();
    v59 = v30;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setRecencyOrderOfAppUsageFromSiri:](v5, "setRecencyOrderOfAppUsageFromSiri:", [v30 intValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"timeSinceAppUsedFromSiriInSec"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTimeSinceAppUsedFromSiriInSec:](v5, "setTimeSinceAppUsedFromSiriInSec:", [v31 longLongValue]);
    }
    v32 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingApp2Min"];
    objc_opt_class();
    v58 = v32;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp2Min:](v5, "setTaskAbandonCountInUsingApp2Min:", [v32 intValue]);
    }
    v50 = v15;
    v33 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingApp10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp10Min:](v5, "setTaskAbandonCountInUsingApp10Min:", [v33 intValue]);
    }
    v49 = v19;
    v34 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingApp1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp1Hr:](v5, "setTaskAbandonCountInUsingApp1Hr:", [v34 intValue]);
    }
    v44 = v34;
    v47 = v29;
    v35 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingApp6Hrs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp6Hrs:](v5, "setTaskAbandonCountInUsingApp6Hrs:", [v35 intValue]);
    }
    v46 = v31;
    v36 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingApp1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp1Day:](v5, "setTaskAbandonCountInUsingApp1Day:", [v36 intValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingApp7Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp7Days:](v5, "setTaskAbandonCountInUsingApp7Days:", [v37 intValue]);
    }
    v45 = v33;
    v52 = v26;
    v38 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingApp14Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp14Days:](v5, "setTaskAbandonCountInUsingApp14Days:", [v38 intValue]);
    }
    v39 = v27;
    v40 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingApp28Days"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingApp28Days:](v5, "setTaskAbandonCountInUsingApp28Days:", [v40 intValue]);
    }
    v41 = [v4 objectForKeyedSubscript:@"taskAbandonCountInUsingAppInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals setTaskAbandonCountInUsingAppInf:](v5, "setTaskAbandonCountInUsingAppInf:", [v41 intValue]);
    }
    v42 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals *)self dictionaryRepresentation];
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount10Min](self, "appUsageCount10Min"));
    [v3 setObject:v7 forKeyedSubscript:@"appUsageCount10Min"];

    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount14Days](self, "appUsageCount14Days"));
  [v3 setObject:v8 forKeyedSubscript:@"appUsageCount14Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount1Day](self, "appUsageCount1Day"));
  [v3 setObject:v9 forKeyedSubscript:@"appUsageCount1Day"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount1Hr](self, "appUsageCount1Hr"));
  [v3 setObject:v10 forKeyedSubscript:@"appUsageCount1Hr"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount28Days](self, "appUsageCount28Days"));
  [v3 setObject:v11 forKeyedSubscript:@"appUsageCount28Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount2Min](self, "appUsageCount2Min"));
  [v3 setObject:v12 forKeyedSubscript:@"appUsageCount2Min"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount6Hrs](self, "appUsageCount6Hrs"));
  [v3 setObject:v13 forKeyedSubscript:@"appUsageCount6Hrs"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCount7Days](self, "appUsageCount7Days"));
  [v3 setObject:v14 forKeyedSubscript:@"appUsageCount7Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri10Min](self, "appUsageCountFromSiri10Min"));
  [v3 setObject:v15 forKeyedSubscript:@"appUsageCountFromSiri10Min"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri14Days](self, "appUsageCountFromSiri14Days"));
  [v3 setObject:v16 forKeyedSubscript:@"appUsageCountFromSiri14Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  v17 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri1Day](self, "appUsageCountFromSiri1Day"));
  [v3 setObject:v17 forKeyedSubscript:@"appUsageCountFromSiri1Day"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  v18 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri1Hr](self, "appUsageCountFromSiri1Hr"));
  [v3 setObject:v18 forKeyedSubscript:@"appUsageCountFromSiri1Hr"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  v19 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri28Days](self, "appUsageCountFromSiri28Days"));
  [v3 setObject:v19 forKeyedSubscript:@"appUsageCountFromSiri28Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri2Min](self, "appUsageCountFromSiri2Min"));
  [v3 setObject:v20 forKeyedSubscript:@"appUsageCountFromSiri2Min"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri6Hrs](self, "appUsageCountFromSiri6Hrs"));
  [v3 setObject:v21 forKeyedSubscript:@"appUsageCountFromSiri6Hrs"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiri7Days](self, "appUsageCountFromSiri7Days"));
  [v3 setObject:v22 forKeyedSubscript:@"appUsageCountFromSiri7Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  v23 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountFromSiriInf](self, "appUsageCountFromSiriInf"));
  [v3 setObject:v23 forKeyedSubscript:@"appUsageCountFromSiriInf"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  v24 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals appUsageCountInf](self, "appUsageCountInf"));
  [v3 setObject:v24 forKeyedSubscript:@"appUsageCountInf"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals recencyOrderOfAppUsageFromSiri](self, "recencyOrderOfAppUsageFromSiri"));
  [v3 setObject:v25 forKeyedSubscript:@"recencyOrderOfAppUsageFromSiri"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_56;
  }
LABEL_55:
  v26 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals recencyOrderOfAppUsed](self, "recencyOrderOfAppUsed"));
  [v3 setObject:v26 forKeyedSubscript:@"recencyOrderOfAppUsed"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_57;
  }
LABEL_56:
  v27 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp10Min](self, "taskAbandonCountInUsingApp10Min"));
  [v3 setObject:v27 forKeyedSubscript:@"taskAbandonCountInUsingApp10Min"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_58;
  }
LABEL_57:
  v28 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp14Days](self, "taskAbandonCountInUsingApp14Days"));
  [v3 setObject:v28 forKeyedSubscript:@"taskAbandonCountInUsingApp14Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_59;
  }
LABEL_58:
  v29 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp1Day](self, "taskAbandonCountInUsingApp1Day"));
  [v3 setObject:v29 forKeyedSubscript:@"taskAbandonCountInUsingApp1Day"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_60;
  }
LABEL_59:
  v30 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp1Hr](self, "taskAbandonCountInUsingApp1Hr"));
  [v3 setObject:v30 forKeyedSubscript:@"taskAbandonCountInUsingApp1Hr"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }
LABEL_60:
  v31 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp28Days](self, "taskAbandonCountInUsingApp28Days"));
  [v3 setObject:v31 forKeyedSubscript:@"taskAbandonCountInUsingApp28Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }
LABEL_61:
  v32 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp2Min](self, "taskAbandonCountInUsingApp2Min"));
  [v3 setObject:v32 forKeyedSubscript:@"taskAbandonCountInUsingApp2Min"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_63;
  }
LABEL_62:
  v33 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp6Hrs](self, "taskAbandonCountInUsingApp6Hrs"));
  [v3 setObject:v33 forKeyedSubscript:@"taskAbandonCountInUsingApp6Hrs"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  v34 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingApp7Days](self, "taskAbandonCountInUsingApp7Days"));
  [v3 setObject:v34 forKeyedSubscript:@"taskAbandonCountInUsingApp7Days"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  v35 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals taskAbandonCountInUsingAppInf](self, "taskAbandonCountInUsingAppInf"));
  [v3 setObject:v35 forKeyedSubscript:@"taskAbandonCountInUsingAppInf"];

  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_65:
  v36 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals timeSinceAppUsedFromSiriInSec](self, "timeSinceAppUsedFromSiriInSec"));
  [v3 setObject:v36 forKeyedSubscript:@"timeSinceAppUsedFromSiriInSec"];

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_32:
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignals timeSinceAppUsedInSec](self, "timeSinceAppUsedInSec"));
    [v3 setObject:v5 forKeyedSubscript:@"timeSinceAppUsedInSec"];
  }
LABEL_33:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t v34 = 2654435761 * self->_appUsageCount2Min;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v33 = 2654435761 * self->_appUsageCount10Min;
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
    uint64_t v32 = 2654435761 * self->_appUsageCount1Hr;
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
    uint64_t v31 = 2654435761 * self->_appUsageCount6Hrs;
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
    uint64_t v30 = 2654435761 * self->_appUsageCount1Day;
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
    uint64_t v3 = 2654435761 * self->_appUsageCount7Days;
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
    uint64_t v4 = 2654435761 * self->_appUsageCount14Days;
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
    uint64_t v5 = 2654435761 * self->_appUsageCount28Days;
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
    uint64_t v6 = 2654435761 * self->_appUsageCountInf;
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
    uint64_t v7 = 2654435761 * self->_recencyOrderOfAppUsed;
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
    uint64_t v8 = 2654435761 * self->_timeSinceAppUsedInSec;
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
    uint64_t v9 = 2654435761 * self->_appUsageCountFromSiri2Min;
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
    uint64_t v10 = 2654435761 * self->_appUsageCountFromSiri10Min;
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
    uint64_t v11 = 2654435761 * self->_appUsageCountFromSiri1Hr;
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
    uint64_t v12 = 2654435761 * self->_appUsageCountFromSiri6Hrs;
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
    uint64_t v13 = 2654435761 * self->_appUsageCountFromSiri1Day;
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
    uint64_t v14 = 2654435761 * self->_appUsageCountFromSiri7Days;
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
    uint64_t v15 = 2654435761 * self->_appUsageCountFromSiri14Days;
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
    uint64_t v16 = 2654435761 * self->_appUsageCountFromSiri28Days;
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
    uint64_t v17 = 2654435761 * self->_appUsageCountFromSiriInf;
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
    uint64_t v18 = 2654435761 * self->_recencyOrderOfAppUsageFromSiri;
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
    uint64_t v19 = 2654435761 * self->_timeSinceAppUsedFromSiriInSec;
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
    uint64_t v20 = 2654435761 * self->_taskAbandonCountInUsingApp2Min;
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
    uint64_t v21 = 2654435761 * self->_taskAbandonCountInUsingApp10Min;
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
    uint64_t v22 = 2654435761 * self->_taskAbandonCountInUsingApp1Hr;
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
    uint64_t v23 = 2654435761 * self->_taskAbandonCountInUsingApp6Hrs;
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
    uint64_t v24 = 2654435761 * self->_taskAbandonCountInUsingApp1Day;
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
    uint64_t v25 = 2654435761 * self->_taskAbandonCountInUsingApp7Days;
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
    uint64_t v26 = 2654435761 * self->_taskAbandonCountInUsingApp14Days;
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
  uint64_t v27 = 2654435761 * self->_taskAbandonCountInUsingApp28Days;
  if ((*(_DWORD *)&has & 0x40000000) == 0) {
    goto LABEL_63;
  }
LABEL_32:
  uint64_t v28 = 2654435761 * self->_taskAbandonCountInUsingAppInf;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_126;
  }
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  unsigned int v6 = v4[35];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_126;
  }
  if (*(unsigned char *)&has)
  {
    int appUsageCount2Min = self->_appUsageCount2Min;
    if (appUsageCount2Min != [v4 appUsageCount2Min]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_126;
  }
  if (v8)
  {
    int appUsageCount10Min = self->_appUsageCount10Min;
    if (appUsageCount10Min != [v4 appUsageCount10Min]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_126;
  }
  if (v10)
  {
    int appUsageCount1Hr = self->_appUsageCount1Hr;
    if (appUsageCount1Hr != [v4 appUsageCount1Hr]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_126;
  }
  if (v12)
  {
    int appUsageCount6Hrs = self->_appUsageCount6Hrs;
    if (appUsageCount6Hrs != [v4 appUsageCount6Hrs]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_126;
  }
  if (v14)
  {
    int appUsageCount1Day = self->_appUsageCount1Day;
    if (appUsageCount1Day != [v4 appUsageCount1Day]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_126;
  }
  if (v16)
  {
    int appUsageCount7Days = self->_appUsageCount7Days;
    if (appUsageCount7Days != [v4 appUsageCount7Days]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_126;
  }
  if (v18)
  {
    int appUsageCount14Days = self->_appUsageCount14Days;
    if (appUsageCount14Days != [v4 appUsageCount14Days]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_126;
  }
  if (v20)
  {
    int appUsageCount28Days = self->_appUsageCount28Days;
    if (appUsageCount28Days != [v4 appUsageCount28Days]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_126;
  }
  if (v22)
  {
    int appUsageCountInf = self->_appUsageCountInf;
    if (appUsageCountInf != [v4 appUsageCountInf]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_126;
  }
  if (v24)
  {
    int recencyOrderOfAppUsed = self->_recencyOrderOfAppUsed;
    if (recencyOrderOfAppUsed != [v4 recencyOrderOfAppUsed]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_126;
  }
  if (v26)
  {
    int64_t timeSinceAppUsedInSec = self->_timeSinceAppUsedInSec;
    if (timeSinceAppUsedInSec != [v4 timeSinceAppUsedInSec]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1)) {
    goto LABEL_126;
  }
  if (v28)
  {
    int appUsageCountFromSiri2Min = self->_appUsageCountFromSiri2Min;
    if (appUsageCountFromSiri2Min != [v4 appUsageCountFromSiri2Min]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1)) {
    goto LABEL_126;
  }
  if (v30)
  {
    int appUsageCountFromSiri10Min = self->_appUsageCountFromSiri10Min;
    if (appUsageCountFromSiri10Min != [v4 appUsageCountFromSiri10Min]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1)) {
    goto LABEL_126;
  }
  if (v32)
  {
    int appUsageCountFromSiri1Hr = self->_appUsageCountFromSiri1Hr;
    if (appUsageCountFromSiri1Hr != [v4 appUsageCountFromSiri1Hr]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v34 = (*(unsigned int *)&has >> 14) & 1;
  if (v34 != ((v6 >> 14) & 1)) {
    goto LABEL_126;
  }
  if (v34)
  {
    int appUsageCountFromSiri6Hrs = self->_appUsageCountFromSiri6Hrs;
    if (appUsageCountFromSiri6Hrs != [v4 appUsageCountFromSiri6Hrs]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v36 = (*(unsigned int *)&has >> 15) & 1;
  if (v36 != ((v6 >> 15) & 1)) {
    goto LABEL_126;
  }
  if (v36)
  {
    int appUsageCountFromSiri1Day = self->_appUsageCountFromSiri1Day;
    if (appUsageCountFromSiri1Day != [v4 appUsageCountFromSiri1Day]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v38 = HIWORD(*(unsigned int *)&has) & 1;
  if (v38 != (HIWORD(v6) & 1)) {
    goto LABEL_126;
  }
  if (v38)
  {
    int appUsageCountFromSiri7Days = self->_appUsageCountFromSiri7Days;
    if (appUsageCountFromSiri7Days != [v4 appUsageCountFromSiri7Days]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v40 = (*(unsigned int *)&has >> 17) & 1;
  if (v40 != ((v6 >> 17) & 1)) {
    goto LABEL_126;
  }
  if (v40)
  {
    int appUsageCountFromSiri14Days = self->_appUsageCountFromSiri14Days;
    if (appUsageCountFromSiri14Days != [v4 appUsageCountFromSiri14Days]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v42 = (*(unsigned int *)&has >> 18) & 1;
  if (v42 != ((v6 >> 18) & 1)) {
    goto LABEL_126;
  }
  if (v42)
  {
    int appUsageCountFromSiri28Days = self->_appUsageCountFromSiri28Days;
    if (appUsageCountFromSiri28Days != [v4 appUsageCountFromSiri28Days]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v44 = (*(unsigned int *)&has >> 19) & 1;
  if (v44 != ((v6 >> 19) & 1)) {
    goto LABEL_126;
  }
  if (v44)
  {
    int appUsageCountFromSiriInf = self->_appUsageCountFromSiriInf;
    if (appUsageCountFromSiriInf != [v4 appUsageCountFromSiriInf]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v46 = (*(unsigned int *)&has >> 20) & 1;
  if (v46 != ((v6 >> 20) & 1)) {
    goto LABEL_126;
  }
  if (v46)
  {
    int recencyOrderOfAppUsageFromSiri = self->_recencyOrderOfAppUsageFromSiri;
    if (recencyOrderOfAppUsageFromSiri != [v4 recencyOrderOfAppUsageFromSiri]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v48 = (*(unsigned int *)&has >> 21) & 1;
  if (v48 != ((v6 >> 21) & 1)) {
    goto LABEL_126;
  }
  if (v48)
  {
    int64_t timeSinceAppUsedFromSiriInSec = self->_timeSinceAppUsedFromSiriInSec;
    if (timeSinceAppUsedFromSiriInSec != [v4 timeSinceAppUsedFromSiriInSec]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v50 = (*(unsigned int *)&has >> 22) & 1;
  if (v50 != ((v6 >> 22) & 1)) {
    goto LABEL_126;
  }
  if (v50)
  {
    int taskAbandonCountInUsingApp2Min = self->_taskAbandonCountInUsingApp2Min;
    if (taskAbandonCountInUsingApp2Min != [v4 taskAbandonCountInUsingApp2Min]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v52 = (*(unsigned int *)&has >> 23) & 1;
  if (v52 != ((v6 >> 23) & 1)) {
    goto LABEL_126;
  }
  if (v52)
  {
    int taskAbandonCountInUsingApp10Min = self->_taskAbandonCountInUsingApp10Min;
    if (taskAbandonCountInUsingApp10Min != [v4 taskAbandonCountInUsingApp10Min]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v54 = HIBYTE(*(unsigned int *)&has) & 1;
  if (v54 != (HIBYTE(v6) & 1)) {
    goto LABEL_126;
  }
  if (v54)
  {
    int taskAbandonCountInUsingApp1Hr = self->_taskAbandonCountInUsingApp1Hr;
    if (taskAbandonCountInUsingApp1Hr != [v4 taskAbandonCountInUsingApp1Hr]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v56 = (*(unsigned int *)&has >> 25) & 1;
  if (v56 != ((v6 >> 25) & 1)) {
    goto LABEL_126;
  }
  if (v56)
  {
    int taskAbandonCountInUsingApp6Hrs = self->_taskAbandonCountInUsingApp6Hrs;
    if (taskAbandonCountInUsingApp6Hrs != [v4 taskAbandonCountInUsingApp6Hrs]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v58 = (*(unsigned int *)&has >> 26) & 1;
  if (v58 != ((v6 >> 26) & 1)) {
    goto LABEL_126;
  }
  if (v58)
  {
    int taskAbandonCountInUsingApp1Day = self->_taskAbandonCountInUsingApp1Day;
    if (taskAbandonCountInUsingApp1Day != [v4 taskAbandonCountInUsingApp1Day]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v60 = (*(unsigned int *)&has >> 27) & 1;
  if (v60 != ((v6 >> 27) & 1)) {
    goto LABEL_126;
  }
  if (v60)
  {
    int taskAbandonCountInUsingApp7Days = self->_taskAbandonCountInUsingApp7Days;
    if (taskAbandonCountInUsingApp7Days != [v4 taskAbandonCountInUsingApp7Days]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v62 = (*(unsigned int *)&has >> 28) & 1;
  if (v62 != ((v6 >> 28) & 1)) {
    goto LABEL_126;
  }
  if (v62)
  {
    int taskAbandonCountInUsingApp14Days = self->_taskAbandonCountInUsingApp14Days;
    if (taskAbandonCountInUsingApp14Days != [v4 taskAbandonCountInUsingApp14Days]) {
      goto LABEL_126;
    }
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
    unsigned int v6 = v4[35];
  }
  int v64 = (*(unsigned int *)&has >> 29) & 1;
  if (v64 != ((v6 >> 29) & 1)) {
    goto LABEL_126;
  }
  if (v64)
  {
    int taskAbandonCountInUsingApp28Days = self->_taskAbandonCountInUsingApp28Days;
    if (taskAbandonCountInUsingApp28Days == [v4 taskAbandonCountInUsingApp28Days])
    {
      $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
    int taskAbandonCountInUsingAppInf = self->_taskAbandonCountInUsingAppInf;
    if (taskAbandonCountInUsingAppInf != [v4 taskAbandonCountInUsingAppInf]) {
      goto LABEL_126;
    }
  }
  BOOL v68 = 1;
LABEL_127:

  return v68;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteInt32Field();
    $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  $6C0861D200E4D330AE256ED4C8F76FC1 has = self->_has;
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
  return INFERENCESchemaINFERENCECommonAppDependentFrequencyAndRecencySignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteTaskAbandonCountInUsingAppInf
{
  *(_DWORD *)&self->_has &= ~0x40000000u;
}

- (void)setHasTaskAbandonCountInUsingAppInf:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingAppInf
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTaskAbandonCountInUsingAppInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_int taskAbandonCountInUsingAppInf = a3;
}

- (void)deleteTaskAbandonCountInUsingApp28Days
{
  *(_DWORD *)&self->_has &= ~0x20000000u;
}

- (void)setHasTaskAbandonCountInUsingApp28Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingApp28Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setTaskAbandonCountInUsingApp28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_int taskAbandonCountInUsingApp28Days = a3;
}

- (void)deleteTaskAbandonCountInUsingApp14Days
{
  *(_DWORD *)&self->_has &= ~0x10000000u;
}

- (void)setHasTaskAbandonCountInUsingApp14Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingApp14Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setTaskAbandonCountInUsingApp14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_int taskAbandonCountInUsingApp14Days = a3;
}

- (void)deleteTaskAbandonCountInUsingApp7Days
{
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setHasTaskAbandonCountInUsingApp7Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingApp7Days
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setTaskAbandonCountInUsingApp7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_int taskAbandonCountInUsingApp7Days = a3;
}

- (void)deleteTaskAbandonCountInUsingApp1Day
{
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setHasTaskAbandonCountInUsingApp1Day:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingApp1Day
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTaskAbandonCountInUsingApp1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_int taskAbandonCountInUsingApp1Day = a3;
}

- (void)deleteTaskAbandonCountInUsingApp6Hrs
{
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setHasTaskAbandonCountInUsingApp6Hrs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingApp6Hrs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTaskAbandonCountInUsingApp6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_int taskAbandonCountInUsingApp6Hrs = a3;
}

- (void)deleteTaskAbandonCountInUsingApp1Hr
{
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setHasTaskAbandonCountInUsingApp1Hr:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingApp1Hr
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setTaskAbandonCountInUsingApp1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_int taskAbandonCountInUsingApp1Hr = a3;
}

- (void)deleteTaskAbandonCountInUsingApp10Min
{
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setHasTaskAbandonCountInUsingApp10Min:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingApp10Min
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTaskAbandonCountInUsingApp10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_int taskAbandonCountInUsingApp10Min = a3;
}

- (void)deleteTaskAbandonCountInUsingApp2Min
{
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setHasTaskAbandonCountInUsingApp2Min:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTaskAbandonCountInUsingApp2Min
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setTaskAbandonCountInUsingApp2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_int taskAbandonCountInUsingApp2Min = a3;
}

- (void)deleteTimeSinceAppUsedFromSiriInSec
{
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setHasTimeSinceAppUsedFromSiriInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTimeSinceAppUsedFromSiriInSec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTimeSinceAppUsedFromSiriInSec:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_int64_t timeSinceAppUsedFromSiriInSec = a3;
}

- (void)deleteRecencyOrderOfAppUsageFromSiri
{
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setHasRecencyOrderOfAppUsageFromSiri:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRecencyOrderOfAppUsageFromSiri
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRecencyOrderOfAppUsageFromSiri:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_int recencyOrderOfAppUsageFromSiri = a3;
}

- (void)deleteAppUsageCountFromSiriInf
{
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setHasAppUsageCountFromSiriInf:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasAppUsageCountFromSiriInf
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAppUsageCountFromSiriInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_int appUsageCountFromSiriInf = a3;
}

- (void)deleteAppUsageCountFromSiri28Days
{
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setHasAppUsageCountFromSiri28Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasAppUsageCountFromSiri28Days
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setAppUsageCountFromSiri28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_int appUsageCountFromSiri28Days = a3;
}

- (void)deleteAppUsageCountFromSiri14Days
{
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setHasAppUsageCountFromSiri14Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasAppUsageCountFromSiri14Days
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAppUsageCountFromSiri14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_int appUsageCountFromSiri14Days = a3;
}

- (void)deleteAppUsageCountFromSiri7Days
{
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setHasAppUsageCountFromSiri7Days:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasAppUsageCountFromSiri7Days
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setAppUsageCountFromSiri7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_int appUsageCountFromSiri7Days = a3;
}

- (void)deleteAppUsageCountFromSiri1Day
{
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setHasAppUsageCountFromSiri1Day:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasAppUsageCountFromSiri1Day
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setAppUsageCountFromSiri1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_int appUsageCountFromSiri1Day = a3;
}

- (void)deleteAppUsageCountFromSiri6Hrs
{
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setHasAppUsageCountFromSiri6Hrs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasAppUsageCountFromSiri6Hrs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAppUsageCountFromSiri6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_int appUsageCountFromSiri6Hrs = a3;
}

- (void)deleteAppUsageCountFromSiri1Hr
{
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setHasAppUsageCountFromSiri1Hr:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAppUsageCountFromSiri1Hr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setAppUsageCountFromSiri1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_int appUsageCountFromSiri1Hr = a3;
}

- (void)deleteAppUsageCountFromSiri10Min
{
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setHasAppUsageCountFromSiri10Min:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAppUsageCountFromSiri10Min
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setAppUsageCountFromSiri10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_int appUsageCountFromSiri10Min = a3;
}

- (void)deleteAppUsageCountFromSiri2Min
{
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setHasAppUsageCountFromSiri2Min:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasAppUsageCountFromSiri2Min
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setAppUsageCountFromSiri2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_int appUsageCountFromSiri2Min = a3;
}

- (void)deleteTimeSinceAppUsedInSec
{
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setHasTimeSinceAppUsedInSec:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTimeSinceAppUsedInSec
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTimeSinceAppUsedInSec:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_int64_t timeSinceAppUsedInSec = a3;
}

- (void)deleteRecencyOrderOfAppUsed
{
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setHasRecencyOrderOfAppUsed:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRecencyOrderOfAppUsed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRecencyOrderOfAppUsed:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_int recencyOrderOfAppUsed = a3;
}

- (void)deleteAppUsageCountInf
{
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setHasAppUsageCountInf:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasAppUsageCountInf
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setAppUsageCountInf:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_int appUsageCountInf = a3;
}

- (void)deleteAppUsageCount28Days
{
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setHasAppUsageCount28Days:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasAppUsageCount28Days
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setAppUsageCount28Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_int appUsageCount28Days = a3;
}

- (void)deleteAppUsageCount14Days
{
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setHasAppUsageCount14Days:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasAppUsageCount14Days
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAppUsageCount14Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_int appUsageCount14Days = a3;
}

- (void)deleteAppUsageCount7Days
{
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setHasAppUsageCount7Days:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAppUsageCount7Days
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAppUsageCount7Days:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_int appUsageCount7Days = a3;
}

- (void)deleteAppUsageCount1Day
{
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setHasAppUsageCount1Day:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAppUsageCount1Day
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAppUsageCount1Day:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_int appUsageCount1Day = a3;
}

- (void)deleteAppUsageCount6Hrs
{
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setHasAppUsageCount6Hrs:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAppUsageCount6Hrs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppUsageCount6Hrs:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_int appUsageCount6Hrs = a3;
}

- (void)deleteAppUsageCount1Hr
{
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setHasAppUsageCount1Hr:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAppUsageCount1Hr
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAppUsageCount1Hr:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_int appUsageCount1Hr = a3;
}

- (void)deleteAppUsageCount10Min
{
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setHasAppUsageCount10Min:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAppUsageCount10Min
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppUsageCount10Min:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_int appUsageCount10Min = a3;
}

- (void)deleteAppUsageCount2Min
{
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setHasAppUsageCount2Min:(BOOL)a3
{
  self->_$6C0861D200E4D330AE256ED4C8F76FC1 has = ($6C0861D200E4D330AE256ED4C8F76FC1)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAppUsageCount2Min
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAppUsageCount2Min:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_int appUsageCount2Min = a3;
}

@end