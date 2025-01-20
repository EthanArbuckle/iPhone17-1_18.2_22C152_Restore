@interface CLStreamedLocationPrivate
- (BOOL)hasDeltaDistance;
- (BOOL)hasDeltaDistanceAccuracy;
- (BOOL)hasGroundAltitude;
- (BOOL)hasGroundAltitudeUncertainty;
- (BOOL)hasMaxAbsSlope;
- (BOOL)hasOdometer;
- (BOOL)hasSlope;
- (BOOL)hasTimestampGps;
- (BOOL)hasTropicalSavannaBranchCount;
- (BOOL)hasTropicalSavannaProximity;
- (BOOL)hasTropicalSavannaTreeId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLDaemonLocationPrivate)daemonLocationPrivate;
- (CLStreamedLocationPrivate)initWithDaemonLocationPrivate:(const void *)a3;
- (double)deltaDistance;
- (double)deltaDistanceAccuracy;
- (double)groundAltitude;
- (double)groundAltitudeUncertainty;
- (double)maxAbsSlope;
- (double)odometer;
- (double)slope;
- (double)timestampGps;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tropicalSavannaProximityAsString:(int)a3;
- (int)StringAsTropicalSavannaProximity:(id)a3;
- (int)tropicalSavannaProximity;
- (unint64_t)hash;
- (unint64_t)tropicalSavannaTreeId;
- (unsigned)tropicalSavannaBranchCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeltaDistance:(double)a3;
- (void)setDeltaDistanceAccuracy:(double)a3;
- (void)setGroundAltitude:(double)a3;
- (void)setGroundAltitudeUncertainty:(double)a3;
- (void)setHasDeltaDistance:(BOOL)a3;
- (void)setHasDeltaDistanceAccuracy:(BOOL)a3;
- (void)setHasGroundAltitude:(BOOL)a3;
- (void)setHasGroundAltitudeUncertainty:(BOOL)a3;
- (void)setHasMaxAbsSlope:(BOOL)a3;
- (void)setHasOdometer:(BOOL)a3;
- (void)setHasSlope:(BOOL)a3;
- (void)setHasTimestampGps:(BOOL)a3;
- (void)setHasTropicalSavannaBranchCount:(BOOL)a3;
- (void)setHasTropicalSavannaProximity:(BOOL)a3;
- (void)setHasTropicalSavannaTreeId:(BOOL)a3;
- (void)setMaxAbsSlope:(double)a3;
- (void)setOdometer:(double)a3;
- (void)setSlope:(double)a3;
- (void)setTimestampGps:(double)a3;
- (void)setTropicalSavannaBranchCount:(unsigned int)a3;
- (void)setTropicalSavannaProximity:(int)a3;
- (void)setTropicalSavannaTreeId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLStreamedLocationPrivate

- (CLStreamedLocationPrivate)initWithDaemonLocationPrivate:(const void *)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1024858B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1024858B8))
  {
    sub_1000DBC34(&qword_102485638);
    __cxa_atexit((void (*)(void *))sub_100BCE6E0, &qword_102485638, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_1024858B8);
  }
  v5 = [(CLStreamedLocationPrivate *)self init];
  v6 = v5;
  if (v5)
  {
    if (*(double *)a3 != *(double *)&qword_102485638) {
      [(CLStreamedLocationPrivate *)v5 setOdometer:*(double *)a3];
    }
    if (*((double *)a3 + 1) != *(double *)&qword_102485640) {
      -[CLStreamedLocationPrivate setDeltaDistance:](v6, "setDeltaDistance:");
    }
    if (*((double *)a3 + 2) != *(double *)&qword_102485648) {
      -[CLStreamedLocationPrivate setDeltaDistanceAccuracy:](v6, "setDeltaDistanceAccuracy:");
    }
    if (*((double *)a3 + 3) != *(double *)&qword_102485650) {
      -[CLStreamedLocationPrivate setTimestampGps:](v6, "setTimestampGps:");
    }
    if (*((double *)a3 + 45) != *(double *)&qword_1024857A0) {
      -[CLStreamedLocationPrivate setSlope:](v6, "setSlope:");
    }
    if (*((double *)a3 + 46) != *(double *)&qword_1024857A8) {
      -[CLStreamedLocationPrivate setMaxAbsSlope:](v6, "setMaxAbsSlope:");
    }
    if (*((double *)a3 + 47) != *(double *)&qword_1024857B0) {
      -[CLStreamedLocationPrivate setGroundAltitude:](v6, "setGroundAltitude:");
    }
    if (*((double *)a3 + 48) != *(double *)&qword_1024857B8) {
      -[CLStreamedLocationPrivate setGroundAltitudeUncertainty:](v6, "setGroundAltitudeUncertainty:");
    }
    int v7 = *((_DWORD *)a3 + 69);
    if (v7 == dword_10248574C) {
      goto LABEL_30;
    }
    if (v7 == 3)
    {
      uint64_t v8 = 4;
    }
    else
    {
      if (v7 != 4)
      {
LABEL_25:
        if (qword_102419540 != -1) {
          dispatch_once(&qword_102419540, &stru_102311E58);
        }
        v9 = qword_102419548;
        if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67174657;
          LODWORD(v21) = [(CLStreamedLocationPrivate *)v6 tropicalSavannaProximity];
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trackrun,Sending tropicalSavannaProximity,%{private}d", buf, 8u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419540 != -1) {
            dispatch_once(&qword_102419540, &stru_102311E58);
          }
          [(CLStreamedLocationPrivate *)v6 tropicalSavannaProximity];
          v17 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) initWithDaemonLocationPrivate:]", "%s\n", v17);
          if (v17 != (char *)buf) {
            free(v17);
          }
        }
LABEL_30:
        if ([(CLStreamedLocationPrivate *)v6 hasTropicalSavannaProximity])
        {
          int v10 = *((_DWORD *)a3 + 67);
          if (v10 >= 1 && v10 != dword_102485744)
          {
            -[CLStreamedLocationPrivate setTropicalSavannaBranchCount:](v6, "setTropicalSavannaBranchCount:");
            if (qword_102419540 != -1) {
              dispatch_once(&qword_102419540, &stru_102311E58);
            }
            v11 = qword_102419548;
            if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v12 = [(CLStreamedLocationPrivate *)v6 tropicalSavannaBranchCount];
              *(_DWORD *)buf = 67174657;
              LODWORD(v21) = v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trackrun,Sending tropicalSavannaBranchCount,%{private}u", buf, 8u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419540 != -1) {
                dispatch_once(&qword_102419540, &stru_102311E58);
              }
              [(CLStreamedLocationPrivate *)v6 tropicalSavannaBranchCount];
              v18 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) initWithDaemonLocationPrivate:]", "%s\n", v18);
              if (v18 != (char *)buf) {
                free(v18);
              }
            }
          }
        }
        if ([(CLStreamedLocationPrivate *)v6 hasTropicalSavannaProximity])
        {
          uint64_t v13 = *((void *)a3 + 32);
          if (v13)
          {
            if (v13 != qword_102485738)
            {
              -[CLStreamedLocationPrivate setTropicalSavannaTreeId:](v6, "setTropicalSavannaTreeId:");
              if (qword_102419540 != -1) {
                dispatch_once(&qword_102419540, &stru_102311E58);
              }
              v14 = qword_102419548;
              if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v15 = [(CLStreamedLocationPrivate *)v6 tropicalSavannaTreeId];
                *(_DWORD *)buf = 134283521;
                unint64_t v21 = v15;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Trackrun,Sending tropicalSavannaTreeId,%{private}llu", buf, 0xCu);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419540 != -1) {
                  dispatch_once(&qword_102419540, &stru_102311E58);
                }
                [(CLStreamedLocationPrivate *)v6 tropicalSavannaTreeId];
                v19 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) initWithDaemonLocationPrivate:]", "%s\n", v19);
                if (v19 != (char *)buf) {
                  free(v19);
                }
              }
            }
          }
        }
        return v6;
      }
      uint64_t v8 = 5;
    }
    [(CLStreamedLocationPrivate *)v6 setTropicalSavannaProximity:v8];
    goto LABEL_25;
  }
  return v6;
}

- (CLDaemonLocationPrivate)daemonLocationPrivate
{
  if ([(CLStreamedLocationPrivate *)self hasOdometer])
  {
    [(CLStreamedLocationPrivate *)self odometer];
    retstr->odometer = v5;
  }
  if ([(CLStreamedLocationPrivate *)self hasDeltaDistance])
  {
    [(CLStreamedLocationPrivate *)self deltaDistance];
    retstr->deltaDistance = v6;
  }
  if ([(CLStreamedLocationPrivate *)self hasDeltaDistanceAccuracy])
  {
    [(CLStreamedLocationPrivate *)self deltaDistanceAccuracy];
    retstr->deltaDistanceAccuracy = v7;
  }
  if ([(CLStreamedLocationPrivate *)self hasTimestampGps])
  {
    [(CLStreamedLocationPrivate *)self timestampGps];
    retstr->timestampGps = v8;
  }
  if ([(CLStreamedLocationPrivate *)self hasSlope])
  {
    [(CLStreamedLocationPrivate *)self slope];
    retstr->slope = v9;
  }
  if ([(CLStreamedLocationPrivate *)self hasMaxAbsSlope])
  {
    [(CLStreamedLocationPrivate *)self maxAbsSlope];
    retstr->maxAbsSlope = v10;
  }
  if ([(CLStreamedLocationPrivate *)self hasGroundAltitude])
  {
    [(CLStreamedLocationPrivate *)self groundAltitude];
    retstr->groundAltitude = v11;
  }
  if ([(CLStreamedLocationPrivate *)self hasGroundAltitudeUncertainty])
  {
    [(CLStreamedLocationPrivate *)self groundAltitudeUncertainty];
    retstr->groundAltitudeUncertainty = v12;
  }
  if ([(CLStreamedLocationPrivate *)self hasTropicalSavannaProximity])
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_102311E58);
    }
    uint64_t v13 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174657;
      LODWORD(v24) = [(CLStreamedLocationPrivate *)self tropicalSavannaProximity];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Trackrun,Received tropicalSavannaProximity,%{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_102311E58);
      }
      [(CLStreamedLocationPrivate *)self tropicalSavannaProximity];
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    unsigned int v14 = [(CLStreamedLocationPrivate *)self tropicalSavannaProximity];
    if (v14 <= 5) {
      retstr->trackRunData.trackProximity = dword_101DA78DC[v14];
    }
  }
  if ([(CLStreamedLocationPrivate *)self hasTropicalSavannaBranchCount])
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_102311E58);
    }
    unint64_t v15 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [(CLStreamedLocationPrivate *)self tropicalSavannaBranchCount];
      *(_DWORD *)buf = 67174657;
      LODWORD(v24) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Trackrun,Received tropicalSavannaBranchCount,%{private}u", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_102311E58);
      }
      [(CLStreamedLocationPrivate *)self tropicalSavannaBranchCount];
      unint64_t v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    retstr->trackRunData.laneCount = [(CLStreamedLocationPrivate *)self tropicalSavannaBranchCount];
  }
  result = (CLDaemonLocationPrivate *)[(CLStreamedLocationPrivate *)self hasTropicalSavannaTreeId];
  if (result)
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_102311E58);
    }
    v18 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v19 = [(CLStreamedLocationPrivate *)self tropicalSavannaTreeId];
      *(_DWORD *)buf = 134283521;
      unint64_t v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Trackrun,Received tropicalSavannaTreeId,%{private}llu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_102311E58);
      }
      [(CLStreamedLocationPrivate *)self tropicalSavannaTreeId];
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]", "%s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    result = [(CLStreamedLocationPrivate *)self tropicalSavannaTreeId];
    retstr->trackRunData.trackId = (unint64_t)result;
  }
  return result;
}

- (void)setOdometer:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_odometer = a3;
}

- (void)setHasOdometer:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOdometer
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDeltaDistance:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_deltaDistance = a3;
}

- (void)setHasDeltaDistance:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDeltaDistance
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDeltaDistanceAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deltaDistanceAccuracy = a3;
}

- (void)setHasDeltaDistanceAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeltaDistanceAccuracy
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTimestampGps:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_timestampGps = a3;
}

- (void)setHasTimestampGps:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTimestampGps
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSlope:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_slope = a3;
}

- (void)setHasSlope:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSlope
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMaxAbsSlope:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maxAbsSlope = a3;
}

- (void)setHasMaxAbsSlope:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMaxAbsSlope
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGroundAltitude:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_groundAltitude = a3;
}

- (void)setHasGroundAltitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGroundAltitude
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setGroundAltitudeUncertainty:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_groundAltitudeUncertainty = a3;
}

- (void)setHasGroundAltitudeUncertainty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGroundAltitudeUncertainty
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)tropicalSavannaProximity
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_tropicalSavannaProximity;
  }
  else {
    return 0;
  }
}

- (void)setTropicalSavannaProximity:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_tropicalSavannaProximity = a3;
}

- (void)setHasTropicalSavannaProximity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTropicalSavannaProximity
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)tropicalSavannaProximityAsString:(int)a3
{
  if (a3 >= 6) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_102314020 + a3);
  }
}

- (int)StringAsTropicalSavannaProximity:(id)a3
{
  if ([a3 isEqualToString:@"TSP_PROTOBUF_DEFAULT"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"TSP_UNKNOWN"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"TSP_FAR_FROM"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"TSP_NEAR"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"TSP_POSSIBLY_ON"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"TSP_ON"]) {
    return 5;
  }
  return 0;
}

- (void)setTropicalSavannaBranchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_tropicalSavannaBranchCount = a3;
}

- (void)setHasTropicalSavannaBranchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTropicalSavannaBranchCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTropicalSavannaTreeId:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_tropicalSavannaTreeId = a3;
}

- (void)setHasTropicalSavannaTreeId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTropicalSavannaTreeId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationPrivate;
  return +[NSString stringWithFormat:@"%@ %@", [(CLStreamedLocationPrivate *)&v3 description], [(CLStreamedLocationPrivate *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_odometer)] forKey:@"odometer"];
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithDouble:self->_deltaDistance] forKey:@"deltaDistance"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_deltaDistanceAccuracy)] forKey:@"deltaDistanceAccuracy"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestampGps)] forKey:@"timestampGps"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_slope)] forKey:@"slope"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithDouble:self->_maxAbsSlope] forKey:@"maxAbsSlope"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithDouble:self->_groundAltitude] forKey:@"groundAltitude"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithDouble:self->_groundAltitudeUncertainty] forKey:@"groundAltitudeUncertainty"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
LABEL_26:
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tropicalSavannaBranchCount)] forKey:@"tropicalSavannaBranchCount"];
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      return v3;
    }
    goto LABEL_12;
  }
LABEL_22:
  uint64_t tropicalSavannaProximity = self->_tropicalSavannaProximity;
  if (tropicalSavannaProximity >= 6) {
    double v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_tropicalSavannaProximity];
  }
  else {
    double v7 = (NSString *)*(&off_102314020 + tropicalSavannaProximity);
  }
  [v3 setObject:v7 forKey:@"tropicalSavannaProximity"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_26;
  }
LABEL_11:
  if ((has & 0x100) != 0) {
LABEL_12:
  }
    [v3 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_tropicalSavannaTreeId)] forKey:@"tropicalSavannaTreeId"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10114969C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      return;
    }
    goto LABEL_23;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((has & 0x100) == 0) {
    return;
  }
LABEL_23:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)a3 + 6) = *(void *)&self->_odometer;
    *((_WORD *)a3 + 44) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = *(void *)&self->_deltaDistance;
  *((_WORD *)a3 + 44) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 2) = *(void *)&self->_deltaDistanceAccuracy;
  *((_WORD *)a3 + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)a3 + 8) = *(void *)&self->_timestampGps;
  *((_WORD *)a3 + 44) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 7) = *(void *)&self->_slope;
  *((_WORD *)a3 + 44) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 5) = *(void *)&self->_maxAbsSlope;
  *((_WORD *)a3 + 44) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 3) = *(void *)&self->_groundAltitude;
  *((_WORD *)a3 + 44) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 4) = *(void *)&self->_groundAltitudeUncertainty;
  *((_WORD *)a3 + 44) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 21) = self->_tropicalSavannaProximity;
  *((_WORD *)a3 + 44) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      return;
    }
LABEL_23:
    *((void *)a3 + 9) = self->_tropicalSavannaTreeId;
    *((_WORD *)a3 + 44) |= 0x100u;
    return;
  }
LABEL_22:
  *((_DWORD *)a3 + 20) = self->_tropicalSavannaBranchCount;
  *((_WORD *)a3 + 44) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    goto LABEL_23;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)result + 6) = *(void *)&self->_odometer;
    *((_WORD *)result + 44) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_deltaDistance;
  *((_WORD *)result + 44) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 2) = *(void *)&self->_deltaDistanceAccuracy;
  *((_WORD *)result + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 8) = *(void *)&self->_timestampGps;
  *((_WORD *)result + 44) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 7) = *(void *)&self->_slope;
  *((_WORD *)result + 44) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 5) = *(void *)&self->_maxAbsSlope;
  *((_WORD *)result + 44) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 3) = *(void *)&self->_groundAltitude;
  *((_WORD *)result + 44) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 4) = *(void *)&self->_groundAltitudeUncertainty;
  *((_WORD *)result + 44) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 21) = self->_tropicalSavannaProximity;
  *((_WORD *)result + 44) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 20) = self->_tropicalSavannaBranchCount;
  *((_WORD *)result + 44) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    return result;
  }
LABEL_12:
  *((void *)result + 9) = self->_tropicalSavannaTreeId;
  *((_WORD *)result + 44) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 44);
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_odometer != *((double *)a3 + 6)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
LABEL_56:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_deltaDistance != *((double *)a3 + 1)) {
        goto LABEL_56;
      }
    }
    else if (v7)
    {
      goto LABEL_56;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_deltaDistanceAccuracy != *((double *)a3 + 2)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_timestampGps != *((double *)a3 + 8)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_slope != *((double *)a3 + 7)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_maxAbsSlope != *((double *)a3 + 5)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_groundAltitude != *((double *)a3 + 3)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_groundAltitudeUncertainty != *((double *)a3 + 4)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x400) == 0 || self->_tropicalSavannaProximity != *((_DWORD *)a3 + 21)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 44) & 0x400) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x200) == 0 || self->_tropicalSavannaBranchCount != *((_DWORD *)a3 + 20)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 44) & 0x200) != 0)
    {
      goto LABEL_56;
    }
    LOBYTE(v5) = (v7 & 0x100) == 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x100) == 0 || self->_tropicalSavannaTreeId != *((void *)a3 + 9)) {
        goto LABEL_56;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    double odometer = self->_odometer;
    double v6 = -odometer;
    if (odometer >= 0.0) {
      double v6 = self->_odometer;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has)
  {
    double deltaDistance = self->_deltaDistance;
    double v11 = -deltaDistance;
    if (deltaDistance >= 0.0) {
      double v11 = self->_deltaDistance;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 2) != 0)
  {
    double deltaDistanceAccuracy = self->_deltaDistanceAccuracy;
    double v16 = -deltaDistanceAccuracy;
    if (deltaDistanceAccuracy >= 0.0) {
      double v16 = self->_deltaDistanceAccuracy;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double timestampGps = self->_timestampGps;
    double v21 = -timestampGps;
    if (timestampGps >= 0.0) {
      double v21 = self->_timestampGps;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double slope = self->_slope;
    double v26 = -slope;
    if (slope >= 0.0) {
      double v26 = self->_slope;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double maxAbsSlope = self->_maxAbsSlope;
    double v31 = -maxAbsSlope;
    if (maxAbsSlope >= 0.0) {
      double v31 = self->_maxAbsSlope;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 4) != 0)
  {
    double groundAltitude = self->_groundAltitude;
    double v36 = -groundAltitude;
    if (groundAltitude >= 0.0) {
      double v36 = self->_groundAltitude;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((has & 8) != 0)
  {
    double groundAltitudeUncertainty = self->_groundAltitudeUncertainty;
    double v41 = -groundAltitudeUncertainty;
    if (groundAltitudeUncertainty >= 0.0) {
      double v41 = self->_groundAltitudeUncertainty;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if ((has & 0x400) == 0)
  {
    uint64_t v44 = 0;
    if ((has & 0x200) != 0) {
      goto LABEL_67;
    }
LABEL_70:
    uint64_t v45 = 0;
    if ((has & 0x100) != 0) {
      goto LABEL_68;
    }
LABEL_71:
    unint64_t v46 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46;
  }
  uint64_t v44 = 2654435761 * self->_tropicalSavannaProximity;
  if ((has & 0x200) == 0) {
    goto LABEL_70;
  }
LABEL_67:
  uint64_t v45 = 2654435761 * self->_tropicalSavannaBranchCount;
  if ((has & 0x100) == 0) {
    goto LABEL_71;
  }
LABEL_68:
  unint64_t v46 = 2654435761u * self->_tropicalSavannaTreeId;
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x20) != 0)
  {
    self->_double odometer = *((double *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v3 = *((_WORD *)a3 + 44);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double deltaDistance = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_double deltaDistanceAccuracy = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_double timestampGps = *((double *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_double slope = *((double *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double maxAbsSlope = *((double *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 4) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double groundAltitude = *((double *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 8) == 0)
  {
LABEL_9:
    if ((v3 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double groundAltitudeUncertainty = *((double *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x400) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_uint64_t tropicalSavannaProximity = *((_DWORD *)a3 + 21);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x100) == 0) {
      return;
    }
LABEL_23:
    self->_tropicalSavannaTreeId = *((void *)a3 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    return;
  }
LABEL_22:
  self->_tropicalSavannaBranchCount = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 44) & 0x100) != 0) {
    goto LABEL_23;
  }
}

- (double)odometer
{
  return self->_odometer;
}

- (double)deltaDistance
{
  return self->_deltaDistance;
}

- (double)deltaDistanceAccuracy
{
  return self->_deltaDistanceAccuracy;
}

- (double)timestampGps
{
  return self->_timestampGps;
}

- (double)slope
{
  return self->_slope;
}

- (double)maxAbsSlope
{
  return self->_maxAbsSlope;
}

- (double)groundAltitude
{
  return self->_groundAltitude;
}

- (double)groundAltitudeUncertainty
{
  return self->_groundAltitudeUncertainty;
}

- (unsigned)tropicalSavannaBranchCount
{
  return self->_tropicalSavannaBranchCount;
}

- (unint64_t)tropicalSavannaTreeId
{
  return self->_tropicalSavannaTreeId;
}

@end