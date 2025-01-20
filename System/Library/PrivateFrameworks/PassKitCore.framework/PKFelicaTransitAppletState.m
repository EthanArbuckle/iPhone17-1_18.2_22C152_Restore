@interface PKFelicaTransitAppletState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasGreenCarTicket;
- (BOOL)hasShinkansenTicket;
- (BOOL)isBalanceAllowedForCommute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGreenCarTicketUsed;
- (BOOL)isInShinkansenStation;
- (BOOL)isInStation;
- (BOOL)isLowBalanceNotificationEnabled;
- (BOOL)isShinkansenTicketActive;
- (NSData)greenCarDestinationStationCode;
- (NSData)greenCarOriginStationCode;
- (NSData)shinkansenDestinationStationCode;
- (NSData)shinkansenOriginStationCode;
- (NSData)shinkansenSecondaryDestinationStationCode;
- (NSData)shinkansenSecondaryOriginStationCode;
- (NSNumber)greenCarValidityStartDate;
- (NSNumber)shinkansenArrivalTime;
- (NSNumber)shinkansenCarNumber;
- (NSNumber)shinkansenDepartureTime;
- (NSNumber)shinkansenSeatNumber;
- (NSNumber)shinkansenSeatRow;
- (NSNumber)shinkansenSecondaryArrivalTime;
- (NSNumber)shinkansenSecondaryCarNumber;
- (NSNumber)shinkansenSecondaryDepartureTime;
- (NSNumber)shinkansenSecondarySeatNumber;
- (NSNumber)shinkansenSecondarySeatRow;
- (NSNumber)shinkansenValidityStartDate;
- (NSNumber)shinkansenValidityTerm;
- (NSString)greenCarDestinationStationString;
- (NSString)greenCarOriginStationString;
- (NSString)shinkansenDestinationStationString;
- (NSString)shinkansenOriginStationString;
- (NSString)shinkansenSecondaryDestinationStationString;
- (NSString)shinkansenSecondaryOriginStationString;
- (NSString)shinkansenSecondaryTrainName;
- (NSString)shinkansenTrainName;
- (PKFelicaTransitAppletState)init;
- (PKFelicaTransitAppletState)initWithCoder:(id)a3;
- (id)_concreteTransactionForRecordAtIndex:(unint64_t)a3 withBalance:(unsigned int *)a4 historyRecords:(id)a5 terminalState:(id)a6 numberProcessed:(unint64_t *)a7 exitedShinkansen:(BOOL *)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5;
- (id)transitPassPropertiesWithPaymentApplication:(id)a3;
- (id)transitPassPropertiesWithPaymentApplication:(id)a3 fieldCollection:(id)a4;
- (id)transitPassPropertiesWithPaymentApplication:(id)a3 pass:(id)a4;
- (unint64_t)hash;
- (void)_resolveTransactionsFromState:(id)a3 toState:(id)a4 withHistoryRecords:(id)a5 concreteTransactions:(id *)a6 ephemeralTransaction:(id *)a7;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBalanceAllowedForCommute:(BOOL)a3;
- (void)setGreenCarDestinationStationCode:(id)a3;
- (void)setGreenCarDestinationStationString:(id)a3;
- (void)setGreenCarOriginStationCode:(id)a3;
- (void)setGreenCarOriginStationString:(id)a3;
- (void)setGreenCarTicketUsed:(BOOL)a3;
- (void)setGreenCarValidityStartDate:(id)a3;
- (void)setHasGreenCarTicket:(BOOL)a3;
- (void)setHasShinkansenTicket:(BOOL)a3;
- (void)setLowBalanceNotificationEnabled:(BOOL)a3;
- (void)setShinkansenArrivalTime:(id)a3;
- (void)setShinkansenCarNumber:(id)a3;
- (void)setShinkansenDepartureTime:(id)a3;
- (void)setShinkansenDestinationStationCode:(id)a3;
- (void)setShinkansenDestinationStationString:(id)a3;
- (void)setShinkansenOriginStationCode:(id)a3;
- (void)setShinkansenOriginStationString:(id)a3;
- (void)setShinkansenSeatNumber:(id)a3;
- (void)setShinkansenSeatRow:(id)a3;
- (void)setShinkansenSecondaryArrivalTime:(id)a3;
- (void)setShinkansenSecondaryCarNumber:(id)a3;
- (void)setShinkansenSecondaryDepartureTime:(id)a3;
- (void)setShinkansenSecondaryDestinationStationCode:(id)a3;
- (void)setShinkansenSecondaryDestinationStationString:(id)a3;
- (void)setShinkansenSecondaryOriginStationCode:(id)a3;
- (void)setShinkansenSecondaryOriginStationString:(id)a3;
- (void)setShinkansenSecondarySeatNumber:(id)a3;
- (void)setShinkansenSecondarySeatRow:(id)a3;
- (void)setShinkansenSecondaryTrainName:(id)a3;
- (void)setShinkansenTicketActive:(BOOL)a3;
- (void)setShinkansenTrainName:(id)a3;
- (void)setShinkansenValidityStartDate:(id)a3;
- (void)setShinkansenValidityTerm:(id)a3;
@end

@implementation PKFelicaTransitAppletState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaTransitAppletState)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKFelicaTransitAppletState;
  v2 = [(PKFelicaTransitAppletState *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PKTransitAppletState *)v2 setCurrency:@"JPY"];
  }
  return v3;
}

- (PKFelicaTransitAppletState)initWithCoder:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PKFelicaTransitAppletState;
  objc_super v5 = [(PKTransitAppletState *)&v65 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(PKTransitAppletState *)v5 setCurrency:@"JPY"];
    v7 = [(PKTransitAppletState *)v6 enrouteTransitTypes];
    int v8 = [v7 containsObject:@"TransitMetro"];

    if (v8) {
      [(PKTransitAppletState *)v6 setEnrouteTransitTypes:0];
    }
    v9 = [(PKTransitAppletState *)v6 enrouteTransitTypes];

    if (!v9)
    {
      if ([v4 decodeBoolForKey:@"inStation"]) {
        [(PKTransitAppletState *)v6 addEnrouteTransitType:@"Transit"];
      }
      if ([v4 decodeBoolForKey:@"inShinkansenStation"]) {
        [(PKTransitAppletState *)v6 addEnrouteTransitType:@"TransitTrainShinkansen"];
      }
    }
    v6->_shinkansenTicketActive = [v4 decodeBoolForKey:@"shinkansenTicketActive"];
    v6->_greenCarTicketUsed = [v4 decodeBoolForKey:@"greenCarTicketUsed"];
    v6->_balanceAllowedForCommute = [v4 decodeBoolForKey:@"balanceAllowedForCommute"];
    v6->_lowBalanceNotificationEnabled = [v4 decodeBoolForKey:@"lowBalanceNotificationEnabled"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenValidityStartDate"];
    shinkansenValidityStartDate = v6->_shinkansenValidityStartDate;
    v6->_shinkansenValidityStartDate = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenValidityTerm"];
    shinkansenValidityTerm = v6->_shinkansenValidityTerm;
    v6->_shinkansenValidityTerm = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenOriginStation"];
    shinkansenOriginStationCode = v6->_shinkansenOriginStationCode;
    v6->_shinkansenOriginStationCode = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenDestinationStation"];
    shinkansenDestinationStationCode = v6->_shinkansenDestinationStationCode;
    v6->_shinkansenDestinationStationCode = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenDepartureTime"];
    shinkansenDepartureTime = v6->_shinkansenDepartureTime;
    v6->_shinkansenDepartureTime = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenArrivalTime"];
    shinkansenArrivalTime = v6->_shinkansenArrivalTime;
    v6->_shinkansenArrivalTime = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenTrainName"];
    shinkansenTrainName = v6->_shinkansenTrainName;
    v6->_shinkansenTrainName = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenCarNumber"];
    shinkansenCarNumber = v6->_shinkansenCarNumber;
    v6->_shinkansenCarNumber = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSeatRow"];
    shinkansenSeatRow = v6->_shinkansenSeatRow;
    v6->_shinkansenSeatRow = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSeatNumber"];
    shinkansenSeatNumber = v6->_shinkansenSeatNumber;
    v6->_shinkansenSeatNumber = (NSNumber *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondaryOriginStation"];
    shinkansenSecondaryOriginStationCode = v6->_shinkansenSecondaryOriginStationCode;
    v6->_shinkansenSecondaryOriginStationCode = (NSData *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondaryDestinationStation"];
    shinkansenSecondaryDestinationStationCode = v6->_shinkansenSecondaryDestinationStationCode;
    v6->_shinkansenSecondaryDestinationStationCode = (NSData *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondaryDepartureTime"];
    shinkansenSecondaryDepartureTime = v6->_shinkansenSecondaryDepartureTime;
    v6->_shinkansenSecondaryDepartureTime = (NSNumber *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondaryArrivalTime"];
    shinkansenSecondaryArrivalTime = v6->_shinkansenSecondaryArrivalTime;
    v6->_shinkansenSecondaryArrivalTime = (NSNumber *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondaryTrainName"];
    shinkansenSecondaryTrainName = v6->_shinkansenSecondaryTrainName;
    v6->_shinkansenSecondaryTrainName = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondaryCarNumber"];
    shinkansenSecondaryCarNumber = v6->_shinkansenSecondaryCarNumber;
    v6->_shinkansenSecondaryCarNumber = (NSNumber *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondarySeatRow"];
    shinkansenSecondarySeatRow = v6->_shinkansenSecondarySeatRow;
    v6->_shinkansenSecondarySeatRow = (NSNumber *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondarySeatNumber"];
    shinkansenSecondarySeatNumber = v6->_shinkansenSecondarySeatNumber;
    v6->_shinkansenSecondarySeatNumber = (NSNumber *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"greenCarOriginStation"];
    greenCarOriginStationCode = v6->_greenCarOriginStationCode;
    v6->_greenCarOriginStationCode = (NSData *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"greenCarDestinationStation"];
    greenCarDestinationStationCode = v6->_greenCarDestinationStationCode;
    v6->_greenCarDestinationStationCode = (NSData *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"greenCarValidityStartDate"];
    greenCarValidityStartDate = v6->_greenCarValidityStartDate;
    v6->_greenCarValidityStartDate = (NSNumber *)v50;

    v6->_hasShinkansenTicket = [v4 decodeBoolForKey:@"hasShinkansenTicket"];
    v6->_hasGreenCarTicket = [v4 decodeBoolForKey:@"hasGreenCarTicket"];
    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenOriginStationString"];
    shinkansenOriginStationString = v6->_shinkansenOriginStationString;
    v6->_shinkansenOriginStationString = (NSString *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenDestinationStationString"];
    shinkansenDestinationStationString = v6->_shinkansenDestinationStationString;
    v6->_shinkansenDestinationStationString = (NSString *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondaryOriginStationString"];
    shinkansenSecondaryOriginStationString = v6->_shinkansenSecondaryOriginStationString;
    v6->_shinkansenSecondaryOriginStationString = (NSString *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shinkansenSecondaryDestinationStationString"];
    shinkansenSecondaryDestinationStationString = v6->_shinkansenSecondaryDestinationStationString;
    v6->_shinkansenSecondaryDestinationStationString = (NSString *)v58;

    uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"greenCarOriginStationString"];
    greenCarOriginStationString = v6->_greenCarOriginStationString;
    v6->_greenCarOriginStationString = (NSString *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"greenCarDestinationStationString"];
    greenCarDestinationStationString = v6->_greenCarDestinationStationString;
    v6->_greenCarDestinationStationString = (NSString *)v62;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKFelicaTransitAppletState;
  id v4 = a3;
  [(PKTransitAppletState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[PKFelicaTransitAppletState isInShinkansenStation](self, "isInShinkansenStation", v5.receiver, v5.super_class), @"inShinkansenStation");
  [v4 encodeBool:self->_shinkansenTicketActive forKey:@"shinkansenTicketActive"];
  [v4 encodeBool:self->_greenCarTicketUsed forKey:@"greenCarTicketUsed"];
  [v4 encodeBool:self->_balanceAllowedForCommute forKey:@"balanceAllowedForCommute"];
  [v4 encodeBool:self->_lowBalanceNotificationEnabled forKey:@"lowBalanceNotificationEnabled"];
  [v4 encodeObject:self->_shinkansenValidityStartDate forKey:@"shinkansenValidityStartDate"];
  [v4 encodeObject:self->_shinkansenValidityTerm forKey:@"shinkansenValidityTerm"];
  [v4 encodeObject:self->_shinkansenOriginStationCode forKey:@"shinkansenOriginStation"];
  [v4 encodeObject:self->_shinkansenDestinationStationCode forKey:@"shinkansenDestinationStation"];
  [v4 encodeObject:self->_shinkansenDepartureTime forKey:@"shinkansenDepartureTime"];
  [v4 encodeObject:self->_shinkansenArrivalTime forKey:@"shinkansenArrivalTime"];
  [v4 encodeObject:self->_shinkansenTrainName forKey:@"shinkansenTrainName"];
  [v4 encodeObject:self->_shinkansenCarNumber forKey:@"shinkansenCarNumber"];
  [v4 encodeObject:self->_shinkansenSeatRow forKey:@"shinkansenSeatRow"];
  [v4 encodeObject:self->_shinkansenSeatNumber forKey:@"shinkansenSeatNumber"];
  [v4 encodeObject:self->_shinkansenSecondaryOriginStationCode forKey:@"shinkansenSecondaryOriginStation"];
  [v4 encodeObject:self->_shinkansenSecondaryDestinationStationCode forKey:@"shinkansenSecondaryDestinationStation"];
  [v4 encodeObject:self->_shinkansenSecondaryDepartureTime forKey:@"shinkansenSecondaryDepartureTime"];
  [v4 encodeObject:self->_shinkansenSecondaryArrivalTime forKey:@"shinkansenSecondaryArrivalTime"];
  [v4 encodeObject:self->_shinkansenSecondaryTrainName forKey:@"shinkansenSecondaryTrainName"];
  [v4 encodeObject:self->_shinkansenSecondaryCarNumber forKey:@"shinkansenSecondaryCarNumber"];
  [v4 encodeObject:self->_shinkansenSecondarySeatRow forKey:@"shinkansenSecondarySeatRow"];
  [v4 encodeObject:self->_shinkansenSecondarySeatNumber forKey:@"shinkansenSecondarySeatNumber"];
  [v4 encodeObject:self->_greenCarOriginStationCode forKey:@"greenCarOriginStation"];
  [v4 encodeObject:self->_greenCarDestinationStationCode forKey:@"greenCarDestinationStation"];
  [v4 encodeObject:self->_greenCarValidityStartDate forKey:@"greenCarValidityStartDate"];
  [v4 encodeBool:self->_hasShinkansenTicket forKey:@"hasShinkansenTicket"];
  [v4 encodeBool:self->_hasGreenCarTicket forKey:@"hasGreenCarTicket"];
  [v4 encodeObject:self->_shinkansenOriginStationString forKey:@"shinkansenOriginStationString"];
  [v4 encodeObject:self->_shinkansenDestinationStationString forKey:@"shinkansenDestinationStationString"];
  [v4 encodeObject:self->_shinkansenSecondaryOriginStationString forKey:@"shinkansenSecondaryOriginStationString"];
  [v4 encodeObject:self->_shinkansenSecondaryDestinationStationString forKey:@"shinkansenSecondaryDestinationStationString"];
  [v4 encodeObject:self->_greenCarOriginStationString forKey:@"greenCarOriginStationString"];
  [v4 encodeObject:self->_greenCarDestinationStationString forKey:@"greenCarDestinationStationString"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKFelicaTransitAppletState;
  id v4 = [(PKTransitAppletState *)&v6 copyWithZone:a3];
  [v4 setShinkansenTicketActive:self->_shinkansenTicketActive];
  [v4 setGreenCarTicketUsed:self->_greenCarTicketUsed];
  [v4 setBalanceAllowedForCommute:self->_balanceAllowedForCommute];
  [v4 setLowBalanceNotificationEnabled:self->_lowBalanceNotificationEnabled];
  [v4 setShinkansenValidityStartDate:self->_shinkansenValidityStartDate];
  [v4 setShinkansenValidityTerm:self->_shinkansenValidityTerm];
  [v4 setShinkansenOriginStationCode:self->_shinkansenOriginStationCode];
  [v4 setShinkansenDestinationStationCode:self->_shinkansenDestinationStationCode];
  [v4 setShinkansenDepartureTime:self->_shinkansenDepartureTime];
  [v4 setShinkansenArrivalTime:self->_shinkansenArrivalTime];
  [v4 setShinkansenTrainName:self->_shinkansenTrainName];
  [v4 setShinkansenCarNumber:self->_shinkansenCarNumber];
  [v4 setShinkansenSeatRow:self->_shinkansenSeatRow];
  [v4 setShinkansenSeatNumber:self->_shinkansenSeatNumber];
  [v4 setShinkansenSecondaryOriginStationCode:self->_shinkansenSecondaryOriginStationCode];
  [v4 setShinkansenSecondaryDestinationStationCode:self->_shinkansenSecondaryDestinationStationCode];
  [v4 setShinkansenSecondaryDepartureTime:self->_shinkansenSecondaryDepartureTime];
  [v4 setShinkansenSecondaryArrivalTime:self->_shinkansenSecondaryArrivalTime];
  [v4 setShinkansenSecondaryTrainName:self->_shinkansenSecondaryTrainName];
  [v4 setShinkansenSecondaryCarNumber:self->_shinkansenSecondaryCarNumber];
  [v4 setShinkansenSecondarySeatRow:self->_shinkansenSecondarySeatRow];
  [v4 setShinkansenSecondarySeatNumber:self->_shinkansenSecondarySeatNumber];
  [v4 setGreenCarOriginStationCode:self->_greenCarOriginStationCode];
  [v4 setGreenCarDestinationStationCode:self->_greenCarDestinationStationCode];
  [v4 setGreenCarValidityStartDate:self->_greenCarValidityStartDate];
  [v4 setHasShinkansenTicket:self->_hasShinkansenTicket];
  [v4 setHasGreenCarTicket:self->_hasGreenCarTicket];
  [v4 setShinkansenOriginStationString:self->_shinkansenOriginStationString];
  [v4 setShinkansenDestinationStationString:self->_shinkansenDestinationStationString];
  [v4 setShinkansenSecondaryOriginStationString:self->_shinkansenSecondaryOriginStationString];
  [v4 setShinkansenSecondaryDestinationStationString:self->_shinkansenSecondaryDestinationStationString];
  [v4 setGreenCarOriginStationString:self->_greenCarOriginStationString];
  [v4 setGreenCarDestinationStationString:self->_greenCarDestinationStationString];
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKFelicaTransitAppletState;
  [(PKFelicaTransitAppletState *)&v2 dealloc];
}

- (BOOL)isInStation
{
  objc_super v2 = [(PKTransitAppletState *)self enrouteTransitTypes];
  char v3 = [v2 containsObject:@"Transit"];

  return v3;
}

- (BOOL)isInShinkansenStation
{
  objc_super v2 = [(PKTransitAppletState *)self enrouteTransitTypes];
  char v3 = [v2 containsObject:@"TransitTrainShinkansen"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_super v5 = 0;
    goto LABEL_13;
  }
  objc_super v5 = v4;
  v62.receiver = self;
  v62.super_class = (Class)PKFelicaTransitAppletState;
  if (![(PKTransitAppletState *)&v62 isEqual:v5]
    || self->_shinkansenTicketActive != *((unsigned __int8 *)v5 + 88)
    || self->_greenCarTicketUsed != *((unsigned __int8 *)v5 + 89)
    || self->_balanceAllowedForCommute != *((unsigned __int8 *)v5 + 90)
    || self->_lowBalanceNotificationEnabled != *((unsigned __int8 *)v5 + 91))
  {
    goto LABEL_13;
  }
  shinkansenValidityStartDate = self->_shinkansenValidityStartDate;
  v7 = (NSNumber *)v5[12];
  if (shinkansenValidityStartDate && v7)
  {
    if ((-[NSNumber isEqual:](shinkansenValidityStartDate, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenValidityStartDate != v7)
  {
    goto LABEL_13;
  }
  shinkansenValidityTerm = self->_shinkansenValidityTerm;
  v11 = (NSNumber *)v5[13];
  if (shinkansenValidityTerm && v11)
  {
    if ((-[NSNumber isEqual:](shinkansenValidityTerm, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenValidityTerm != v11)
  {
    goto LABEL_13;
  }
  shinkansenOriginStationCode = self->_shinkansenOriginStationCode;
  v13 = (NSData *)v5[14];
  if (shinkansenOriginStationCode && v13)
  {
    if ((-[NSData isEqual:](shinkansenOriginStationCode, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenOriginStationCode != v13)
  {
    goto LABEL_13;
  }
  shinkansenDestinationStationCode = self->_shinkansenDestinationStationCode;
  v15 = (NSData *)v5[15];
  if (shinkansenDestinationStationCode && v15)
  {
    if ((-[NSData isEqual:](shinkansenDestinationStationCode, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenDestinationStationCode != v15)
  {
    goto LABEL_13;
  }
  shinkansenDepartureTime = self->_shinkansenDepartureTime;
  v17 = (NSNumber *)v5[16];
  if (shinkansenDepartureTime && v17)
  {
    if ((-[NSNumber isEqual:](shinkansenDepartureTime, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenDepartureTime != v17)
  {
    goto LABEL_13;
  }
  shinkansenArrivalTime = self->_shinkansenArrivalTime;
  v19 = (NSNumber *)v5[17];
  if (shinkansenArrivalTime && v19)
  {
    if ((-[NSNumber isEqual:](shinkansenArrivalTime, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenArrivalTime != v19)
  {
    goto LABEL_13;
  }
  shinkansenTrainName = self->_shinkansenTrainName;
  v21 = (NSString *)v5[18];
  if (shinkansenTrainName && v21)
  {
    if ((-[NSString isEqual:](shinkansenTrainName, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenTrainName != v21)
  {
    goto LABEL_13;
  }
  shinkansenCarNumber = self->_shinkansenCarNumber;
  v23 = (NSNumber *)v5[19];
  if (shinkansenCarNumber && v23)
  {
    if ((-[NSNumber isEqual:](shinkansenCarNumber, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenCarNumber != v23)
  {
    goto LABEL_13;
  }
  shinkansenSeatRow = self->_shinkansenSeatRow;
  v25 = (NSNumber *)v5[20];
  if (shinkansenSeatRow && v25)
  {
    if ((-[NSNumber isEqual:](shinkansenSeatRow, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSeatRow != v25)
  {
    goto LABEL_13;
  }
  shinkansenSeatNumber = self->_shinkansenSeatNumber;
  v27 = (NSNumber *)v5[21];
  if (shinkansenSeatNumber && v27)
  {
    if ((-[NSNumber isEqual:](shinkansenSeatNumber, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSeatNumber != v27)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryOriginStationCode = self->_shinkansenSecondaryOriginStationCode;
  v29 = (NSData *)v5[22];
  if (shinkansenSecondaryOriginStationCode && v29)
  {
    if ((-[NSData isEqual:](shinkansenSecondaryOriginStationCode, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondaryOriginStationCode != v29)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryDestinationStationCode = self->_shinkansenSecondaryDestinationStationCode;
  v31 = (NSData *)v5[23];
  if (shinkansenSecondaryDestinationStationCode && v31)
  {
    if ((-[NSData isEqual:](shinkansenSecondaryDestinationStationCode, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondaryDestinationStationCode != v31)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryDepartureTime = self->_shinkansenSecondaryDepartureTime;
  v33 = (NSNumber *)v5[24];
  if (shinkansenSecondaryDepartureTime && v33)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondaryDepartureTime, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondaryDepartureTime != v33)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryArrivalTime = self->_shinkansenSecondaryArrivalTime;
  v35 = (NSNumber *)v5[25];
  if (shinkansenSecondaryArrivalTime && v35)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondaryArrivalTime, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondaryArrivalTime != v35)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryTrainName = self->_shinkansenSecondaryTrainName;
  v37 = (NSString *)v5[26];
  if (shinkansenSecondaryTrainName && v37)
  {
    if ((-[NSString isEqual:](shinkansenSecondaryTrainName, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondaryTrainName != v37)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryCarNumber = self->_shinkansenSecondaryCarNumber;
  v39 = (NSNumber *)v5[27];
  if (shinkansenSecondaryCarNumber && v39)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondaryCarNumber, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondaryCarNumber != v39)
  {
    goto LABEL_13;
  }
  shinkansenSecondarySeatRow = self->_shinkansenSecondarySeatRow;
  v41 = (NSNumber *)v5[28];
  if (shinkansenSecondarySeatRow && v41)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondarySeatRow, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondarySeatRow != v41)
  {
    goto LABEL_13;
  }
  shinkansenSecondarySeatNumber = self->_shinkansenSecondarySeatNumber;
  v43 = (NSNumber *)v5[29];
  if (shinkansenSecondarySeatNumber && v43)
  {
    if ((-[NSNumber isEqual:](shinkansenSecondarySeatNumber, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondarySeatNumber != v43)
  {
    goto LABEL_13;
  }
  greenCarOriginStationCode = self->_greenCarOriginStationCode;
  v45 = (NSData *)v5[30];
  if (greenCarOriginStationCode && v45)
  {
    if ((-[NSData isEqual:](greenCarOriginStationCode, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (greenCarOriginStationCode != v45)
  {
    goto LABEL_13;
  }
  greenCarDestinationStationCode = self->_greenCarDestinationStationCode;
  v47 = (NSData *)v5[31];
  if (greenCarDestinationStationCode && v47)
  {
    if ((-[NSData isEqual:](greenCarDestinationStationCode, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (greenCarDestinationStationCode != v47)
  {
    goto LABEL_13;
  }
  greenCarValidityStartDate = self->_greenCarValidityStartDate;
  v49 = (NSNumber *)v5[32];
  if (greenCarValidityStartDate && v49)
  {
    if ((-[NSNumber isEqual:](greenCarValidityStartDate, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (greenCarValidityStartDate != v49)
  {
    goto LABEL_13;
  }
  if (self->_hasShinkansenTicket != *((unsigned __int8 *)v5 + 92)
    || self->_hasGreenCarTicket != *((unsigned __int8 *)v5 + 93))
  {
    goto LABEL_13;
  }
  shinkansenOriginStationString = self->_shinkansenOriginStationString;
  v51 = (NSString *)v5[33];
  if (shinkansenOriginStationString && v51)
  {
    if ((-[NSString isEqual:](shinkansenOriginStationString, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenOriginStationString != v51)
  {
    goto LABEL_13;
  }
  shinkansenDestinationStationString = self->_shinkansenDestinationStationString;
  v53 = (NSString *)v5[34];
  if (shinkansenDestinationStationString && v53)
  {
    if ((-[NSString isEqual:](shinkansenDestinationStationString, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenDestinationStationString != v53)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryOriginStationString = self->_shinkansenSecondaryOriginStationString;
  v55 = (NSString *)v5[35];
  if (shinkansenSecondaryOriginStationString && v55)
  {
    if ((-[NSString isEqual:](shinkansenSecondaryOriginStationString, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondaryOriginStationString != v55)
  {
    goto LABEL_13;
  }
  shinkansenSecondaryDestinationStationString = self->_shinkansenSecondaryDestinationStationString;
  v57 = (NSString *)v5[36];
  if (shinkansenSecondaryDestinationStationString && v57)
  {
    if ((-[NSString isEqual:](shinkansenSecondaryDestinationStationString, "isEqual:") & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (shinkansenSecondaryDestinationStationString != v57)
  {
    goto LABEL_13;
  }
  greenCarOriginStationString = self->_greenCarOriginStationString;
  v59 = (NSString *)v5[37];
  if (greenCarOriginStationString && v59)
  {
    if (-[NSString isEqual:](greenCarOriginStationString, "isEqual:")) {
      goto LABEL_143;
    }
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  if (greenCarOriginStationString != v59) {
    goto LABEL_13;
  }
LABEL_143:
  greenCarDestinationStationString = self->_greenCarDestinationStationString;
  v61 = (NSString *)v5[38];
  if (greenCarDestinationStationString && v61) {
    char v8 = -[NSString isEqual:](greenCarDestinationStationString, "isEqual:");
  }
  else {
    char v8 = greenCarDestinationStationString == v61;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  char v3 = [NSNumber numberWithUnsignedInteger:(2 * self->_hasShinkansenTicket) | (4* ((2 * self->_lowBalanceNotificationEnabled) | (4 * ((2 * self->_greenCarTicketUsed) | (4 * self->_shinkansenTicketActive) | self->_balanceAllowedForCommute)) | self->_hasGreenCarTicket))];
  uint64_t v4 = [v3 hash];

  v27.receiver = self;
  v27.super_class = (Class)PKFelicaTransitAppletState;
  unint64_t v5 = [(PKTransitAppletState *)&v27 hash];
  uint64_t v6 = v5 ^ [(NSNumber *)self->_shinkansenValidityStartDate hash];
  uint64_t v7 = v6 ^ [(NSNumber *)self->_shinkansenValidityTerm hash];
  uint64_t v8 = v7 ^ [(NSData *)self->_shinkansenOriginStationCode hash];
  uint64_t v9 = v8 ^ [(NSData *)self->_shinkansenDestinationStationCode hash];
  uint64_t v10 = v9 ^ [(NSNumber *)self->_shinkansenDepartureTime hash];
  uint64_t v11 = v10 ^ [(NSNumber *)self->_shinkansenArrivalTime hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_shinkansenTrainName hash];
  uint64_t v13 = v12 ^ [(NSNumber *)self->_shinkansenCarNumber hash];
  uint64_t v14 = v13 ^ [(NSNumber *)self->_shinkansenSeatRow hash];
  uint64_t v15 = v14 ^ [(NSNumber *)self->_shinkansenSeatNumber hash];
  uint64_t v16 = v15 ^ [(NSData *)self->_shinkansenSecondaryOriginStationCode hash] ^ v4;
  uint64_t v17 = [(NSData *)self->_shinkansenSecondaryDestinationStationCode hash];
  uint64_t v18 = v17 ^ [(NSNumber *)self->_shinkansenSecondaryDepartureTime hash];
  uint64_t v19 = v18 ^ [(NSNumber *)self->_shinkansenSecondaryArrivalTime hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_shinkansenSecondaryTrainName hash];
  uint64_t v21 = v20 ^ [(NSNumber *)self->_shinkansenSecondaryCarNumber hash];
  uint64_t v22 = v21 ^ [(NSNumber *)self->_shinkansenSecondarySeatRow hash];
  uint64_t v23 = v22 ^ [(NSNumber *)self->_shinkansenSecondarySeatNumber hash];
  uint64_t v24 = v23 ^ [(NSData *)self->_greenCarOriginStationCode hash];
  uint64_t v25 = v24 ^ [(NSData *)self->_greenCarDestinationStationCode hash];
  return v16 ^ v25 ^ [(NSNumber *)self->_greenCarValidityStartDate hash];
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void *)[(PKFelicaTransitAppletState *)self copy];
  uint64_t v9 = [v7 source];
  [v7 sanitizeValuesWithState:self];
  objc_msgSend(v8, "setBlacklisted:", objc_msgSend(v7, "isBlacklisted"));
  objc_msgSend(v8, "setShinkansenTicketActive:", objc_msgSend(v7, "isShinkansenTicketActive"));
  objc_msgSend(v8, "setGreenCarTicketUsed:", objc_msgSend(v7, "isGreenCarTicketUsed"));
  objc_msgSend(v8, "setBalanceAllowedForCommute:", objc_msgSend(v7, "isBalanceAllowedForCommute"));
  objc_msgSend(v8, "setLowBalanceNotificationEnabled:", objc_msgSend(v7, "isLowBalanceNotificationEnabled"));
  uint64_t v10 = [v8 enrouteTransitTypes];
  uint64_t v11 = [v7 enrouteTransitTypes];
  v83 = self;
  NSUInteger v12 = [(PKTransitAppletState *)self updatedEnrouteTransitTypesFromExistingTypes:v10 newTypes:v11];
  [v8 setEnrouteTransitTypes:v12];

  uint64_t v13 = [v7 shinkansenTicket];
  uint64_t v14 = v13;
  v85 = v13;
  if (v13 || v9 == 1)
  {
    uint64_t v18 = [v13 validityStartDate];
    [v8 setShinkansenValidityStartDate:v18];

    uint64_t v19 = [v14 validityTerm];
    [v8 setShinkansenValidityTerm:v19];

    NSUInteger v20 = [v14 trains];
    unint64_t v21 = [v20 count];
    id v82 = v20;
    if (v21)
    {
      uint64_t v22 = [v20 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v22 = 0;
    }
    id v81 = (id)v9;
    uint64_t v23 = [v22 departureTime];
    [v8 setShinkansenDepartureTime:v23];

    uint64_t v24 = [v22 arrivalTime];
    [v8 setShinkansenArrivalTime:v24];

    uint64_t v25 = [v22 trainName];
    [v8 setShinkansenTrainName:v25];

    uint64_t v26 = [v22 carNumber];
    [v8 setShinkansenCarNumber:v26];

    objc_super v27 = [v22 seatRow];
    [v8 setShinkansenSeatRow:v27];

    uint64_t v28 = [v22 seatNumber];
    [v8 setShinkansenSeatNumber:v28];

    v29 = [v22 originStation];
    uint64_t v30 = [v8 shinkansenOriginStationCode];
    v31 = v30;
    if (v29 && v30)
    {
      char v32 = [v29 isEqual:v30];

      if (v32)
      {
LABEL_10:
        BOOL v33 = 0;
LABEL_13:
        uint64_t v34 = [v22 destinationStation];

        v35 = [v8 shinkansenDestinationStationCode];
        uint64_t v36 = v35;
        if (v34 && v35)
        {
          char v37 = [v34 isEqual:v35];

          if (v37) {
            goto LABEL_24;
          }
        }
        else
        {

          if (v34 == v36) {
            goto LABEL_24;
          }
        }
        [v8 setShinkansenDestinationStationCode:v34];
        [v8 setShinkansenDestinationStationString:0];
        BOOL v33 = v33 || v34 != 0;
LABEL_24:
        if (v21 < 2)
        {
          v39 = 0;
        }
        else
        {
          v39 = [v82 objectAtIndexedSubscript:1];
        }

        uint64_t v40 = [v39 departureTime];
        [v8 setShinkansenSecondaryDepartureTime:v40];

        v41 = [v39 arrivalTime];
        [v8 setShinkansenSecondaryArrivalTime:v41];

        uint64_t v42 = [v39 trainName];
        [v8 setShinkansenSecondaryTrainName:v42];

        v43 = [v39 carNumber];
        [v8 setShinkansenSecondaryCarNumber:v43];

        uint64_t v44 = [v39 seatRow];
        [v8 setShinkansenSecondarySeatRow:v44];

        v45 = [v39 seatNumber];
        [v8 setShinkansenSecondarySeatNumber:v45];

        uint64_t v46 = [v39 originStation];

        v47 = [v8 shinkansenSecondaryOriginStationCode];
        uint64_t v48 = v47;
        if (v46 && v47)
        {
          char v49 = [v46 isEqual:v47];

          if (v49) {
            goto LABEL_38;
          }
        }
        else
        {

          if (v46 == v48) {
            goto LABEL_38;
          }
        }
        [v8 setShinkansenSecondaryOriginStationCode:v46];
        [v8 setShinkansenSecondaryOriginStationString:0];
        BOOL v33 = v33 || v46 != 0;
LABEL_38:
        uint64_t v16 = [v39 destinationStation];

        v51 = [v8 shinkansenSecondaryDestinationStationCode];
        uint64_t v52 = v51;
        uint64_t v9 = (uint64_t)v81;
        if (v16 && v51)
        {
          char v53 = [v16 isEqual:v51];

          if (v53)
          {
LABEL_41:
            uint64_t v15 = a5;
LABEL_49:
            [v8 setHasShinkansenTicket:v85 != 0];

            BOOL v17 = v33;
            goto LABEL_50;
          }
        }
        else
        {

          if (v16 == v52) {
            goto LABEL_41;
          }
        }
        uint64_t v15 = a5;
        [v8 setShinkansenSecondaryDestinationStationCode:v16];
        [v8 setShinkansenSecondaryDestinationStationString:0];
        BOOL v33 = v33 || v16 != 0;
        goto LABEL_49;
      }
    }
    else
    {

      if (v29 == v31) {
        goto LABEL_10;
      }
    }
    BOOL v33 = v29 != 0;
    [v8 setShinkansenOriginStationCode:v29];
    [v8 setShinkansenOriginStationString:0];
    goto LABEL_13;
  }
  uint64_t v15 = a5;
  uint64_t v16 = 0;
  BOOL v17 = 0;
LABEL_50:
  v55 = [v7 greenCarTicket];
  uint64_t v56 = v55;
  if (v55 || v9 == 1)
  {
    v57 = [v55 originStation];

    uint64_t v58 = [v8 greenCarOriginStationCode];
    v59 = v58;
    if (v57 && v58)
    {
      char v60 = [v57 isEqual:v58];

      if (v60) {
        goto LABEL_59;
      }
    }
    else
    {

      if (v57 == v59) {
        goto LABEL_59;
      }
    }
    [v8 setGreenCarOriginStationCode:v57];
    [v8 setGreenCarOriginStationString:0];
    if (v57) {
      BOOL v17 = 1;
    }
LABEL_59:
    uint64_t v16 = [v56 destinationStation];

    v61 = [v8 greenCarDestinationStationCode];
    objc_super v62 = v61;
    if (v16 && v61)
    {
      char v63 = [v16 isEqual:v61];

      if (v63) {
        goto LABEL_66;
      }
    }
    else
    {

      if (v16 == v62)
      {
LABEL_66:
        v64 = [v56 validityStartDate];
        [v8 setGreenCarValidityStartDate:v64];

        [v8 setHasGreenCarTicket:v56 != 0];
        goto LABEL_67;
      }
    }
    [v8 setGreenCarDestinationStationCode:v16];
    [v8 setGreenCarDestinationStationString:0];
    if (v16) {
      BOOL v17 = 1;
    }
    goto LABEL_66;
  }
LABEL_67:
  objc_super v65 = [v8 shinkansenOriginStationCode];
  if (v65)
  {
    uint64_t v66 = 1;
  }
  else
  {
    v67 = [v8 shinkansenDestinationStationCode];
    if (v67)
    {
      uint64_t v66 = 1;
    }
    else
    {
      v68 = [v8 shinkansenSecondaryOriginStationCode];
      if (v68)
      {
        uint64_t v66 = 1;
      }
      else
      {
        v69 = [v8 shinkansenSecondaryDestinationStationCode];
        if (v69)
        {
          uint64_t v66 = 1;
        }
        else
        {
          v70 = [v8 greenCarOriginStationCode];
          if (v70)
          {
            uint64_t v66 = 1;
          }
          else
          {
            v71 = [v8 greenCarDestinationStationCode];
            uint64_t v66 = v71 != 0;

            v70 = 0;
          }

          v69 = 0;
        }
      }
    }
  }
  if (((v66 ^ 1 | v17) & 1) == 0) {
    uint64_t v66 = [v8 needsStationProcessing];
  }
  [v8 setNeedsStationProcessing:v66];
  v72 = [v7 balance];
  [v8 setBalance:v72];

  v73 = [v7 historyRecords];
  if ([v73 count])
  {
    v74 = [v73 objectAtIndexedSubscript:0];
    v75 = [v74 historySequenceNumber];
    if (v75) {
      [v8 setHistorySequenceNumber:v75];
    }
  }
  if ((unint64_t)a4 | (unint64_t)v15 && ![(PKFelicaTransitAppletState *)v83 isEqual:v8])
  {
    [(PKFelicaTransitAppletState *)v83 _resolveTransactionsFromState:v83 toState:v8 withHistoryRecords:v73 concreteTransactions:a4 ephemeralTransaction:v15];
    v76 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      if ([v8 isInStation]) {
        v77 = @"inStation ";
      }
      else {
        v77 = &stru_1EE0F5368;
      }
      int v78 = [v8 isInShinkansenStation];
      v79 = @"inShinkansenStation";
      if (!v78) {
        v79 = &stru_1EE0F5368;
      }
      *(_DWORD *)buf = 138412546;
      v87 = v77;
      __int16 v88 = 2112;
      v89 = v79;
      _os_log_impl(&dword_190E10000, v76, OS_LOG_TYPE_DEFAULT, "Resolved State is: %@%@", buf, 0x16u);
    }
  }
  return v8;
}

- (void)_resolveTransactionsFromState:(id)a3 toState:(id)a4 withHistoryRecords:(id)a5 concreteTransactions:(id *)a6 ephemeralTransaction:(id *)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [v11 historySequenceNumber];
  uint64_t v15 = [v14 unsignedIntegerValue];
  v67 = v14;
  objc_super v65 = v13;
  if (v14
    && ([v12 historySequenceNumber],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 unsignedIntegerValue],
        v16,
        v15 == v17))
  {
    uint64_t v18 = 0;
  }
  else
  {
    id v62 = v12;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v20 = v13;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      char v63 = a6;
      char v60 = a7;
      id v61 = v11;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v72;
      while (2)
      {
        uint64_t v25 = 0;
        uint64_t v26 = v23;
        do
        {
          if (*(void *)v72 != v24) {
            objc_enumerationMutation(v20);
          }
          objc_super v27 = *(void **)(*((void *)&v71 + 1) + 8 * v25);
          uint64_t v23 = [v27 historySequenceNumber];
          uint64_t v28 = [v23 unsignedIntegerValue];
          if (v67 && v15 == v28)
          {

            uint64_t v23 = v26;
            goto LABEL_18;
          }
          if (!v26 || v28 != [v26 unsignedIntegerValue]) {
            [v19 addObject:v27];
          }

          ++v25;
          uint64_t v26 = v23;
        }
        while (v22 != v25);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v71 objects:v75 count:16];
        if (v22) {
          continue;
        }
        break;
      }
LABEL_18:

      a7 = v60;
      id v11 = v61;
      a6 = v63;
    }

    v29 = [v19 reverseObjectEnumerator];
    uint64_t v18 = [v29 allObjects];

    id v12 = v62;
  }
  char v70 = 0;
  uint64_t v30 = [v18 count];
  if (a6)
  {
    unint64_t v31 = v30;
    char v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v30 + 2];
    if (v31)
    {
      v64 = a6;
      BOOL v33 = a7;
      uint64_t v34 = [v11 balance];
      int v35 = [v34 unsignedLongLongValue];

      unint64_t v36 = 0;
      int v69 = v35;
      while (v36 < v31)
      {
        unint64_t v68 = 0;
        char v37 = [(PKFelicaTransitAppletState *)self _concreteTransactionForRecordAtIndex:v36 withBalance:&v69 historyRecords:v18 terminalState:v12 numberProcessed:&v68 exitedShinkansen:&v70];
        if (v37) {
          [v32 addObject:v37];
        }
        unint64_t v38 = v68;
        if (!v68)
        {

          break;
        }
        unint64_t v39 = v31 + ~v36;

        if (v38 <= v39) {
          unint64_t v40 = v38;
        }
        else {
          unint64_t v40 = 0;
        }
        v36 += v40;
        if (v38 > v39) {
          break;
        }
      }
      a7 = v33;
      a6 = v64;
    }
    uint64_t v41 = [v32 count];
    int v42 = [v11 isInShinkansenStation];
    if (v42 == [v12 isInShinkansenStation]
      || v70
      || ([v12 isInShinkansenStation] & 1) != 0)
    {
      int v43 = [v11 isInStation];
      if (v43 == [v12 isInStation] || (objc_msgSend(v12, "isInStation") & 1) != 0 || v41) {
        goto LABEL_43;
      }
      uint64_t v44 = +[PKPaymentTransaction paymentTransactionWithSource:1];
      [v44 setTransactionType:2];
      v45 = v44;
      uint64_t v46 = 1;
    }
    else
    {
      uint64_t v44 = +[PKPaymentTransaction paymentTransactionWithSource:1];
      [v44 setTransactionType:2];
      v45 = v44;
      uint64_t v46 = 257;
    }
    [v45 setTransitType:v46];
    [v44 setOriginatedByDevice:1];
    [v32 addObject:v44];

LABEL_43:
    int v47 = [v11 isGreenCarTicketUsed];
    if (v47 != [v12 isGreenCarTicketUsed]
      && [v12 isGreenCarTicketUsed])
    {
      uint64_t v48 = +[PKPaymentTransaction paymentTransactionWithSource:1];
      [v48 setTransactionType:2];
      [v48 setTransitType:1025];
      [v48 setOriginatedByDevice:1];
      [v32 addObject:v48];
    }
    if (![v32 count])
    {

      char v32 = 0;
    }
    char v49 = (void *)[v32 copy];
    id v50 = *a6;
    *a6 = v49;
  }
  if (a7)
  {
    v51 = [v11 enrouteTransitTypes];
    uint64_t v52 = [v51 lastObject];

    char v53 = [v12 enrouteTransitTypes];
    uint64_t v54 = [v53 lastObject];

    if (v54 && ([v54 isEqual:v52] & 1) == 0)
    {
      uint64_t v56 = a7;
      uint64_t v57 = PKPaymentTransactionTransitSubtypeForTransactionDetailString(v54);
      if (v57)
      {
        uint64_t v58 = v57;
        v55 = +[PKPaymentTransaction paymentTransactionWithSource:1];
        [v55 setTransactionType:2];
        [v55 setTransitType:v58];
        [v55 setEnRoute:1];
        [v55 setOriginatedByDevice:1];
      }
      else
      {
        v55 = 0;
      }
      a7 = v56;
    }
    else
    {
      v55 = 0;
    }
    id v59 = *a7;
    *a7 = v55;
  }
}

- (id)_concreteTransactionForRecordAtIndex:(unint64_t)a3 withBalance:(unsigned int *)a4 historyRecords:(id)a5 terminalState:(id)a6 numberProcessed:(unint64_t *)a7 exitedShinkansen:(BOOL *)a8
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v69 = a6;
  unint64_t v12 = [v11 count];
  id v13 = [v11 objectAtIndexedSubscript:a3];
  id v14 = v13;
  unint64_t v68 = v11;
  char v70 = a4;
  if (a3 + 1 >= v12)
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    BOOL v22 = 0;
    unint64_t v64 = 1;
    goto LABEL_71;
  }
  id v15 = v13;
  uint64_t v16 = [v11 objectAtIndexedSubscript:a3 + 1];
  __int16 v17 = FelicaTransitHistoryRecordFromFelicaRecord(v15);
  uint64_t v19 = v18;
  unint64_t v20 = FelicaTransitHistoryRecordFromFelicaRecord(v16);
  BOOL v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 1;
  if (v17 > 0x15u) {
    goto LABEL_28;
  }
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  id v14 = v15;
  if (((1 << v17) & 0x380062) == 0) {
    goto LABEL_70;
  }
  BOOL v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 1;
  if (v20 > 0x15u) {
    goto LABEL_28;
  }
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  id v14 = v15;
  if (((1 << v20) & 0x380062) == 0) {
    goto LABEL_70;
  }
  BOOL v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 1;
  if (HIBYTE(v17) > 0x1Cu) {
    goto LABEL_28;
  }
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  id v14 = v15;
  if (((1 << SHIBYTE(v17)) & 0x12000090) == 0) {
    goto LABEL_70;
  }
  BOOL v22 = 0;
  uint64_t v23 = 0;
  unint64_t v71 = v20 >> 8;
  uint64_t v24 = 1;
  if (BYTE1(v20) > 0x1Bu)
  {
LABEL_28:
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    id v14 = v15;
    goto LABEL_70;
  }
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  id v14 = v15;
  if (((1 << SBYTE1(v20)) & 0x9000048) != 0)
  {
    unsigned __int8 v27 = v21;
    unint64_t v28 = HIDWORD(v21);
    if (HIDWORD(v19) && HIDWORD(v21) && v21 != v19)
    {
      uint64_t v23 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      BOOL v22 = 0;
      uint64_t v24 = 1;
      id v14 = v15;
      goto LABEL_70;
    }
    __int16 v65 = v20;
    v29 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v15 historySequenceNumber];
      id v31 = [v16 historySequenceNumber];
      *(_DWORD *)buf = 138413058;
      id v75 = v30;
      __int16 v76 = 1024;
      int v77 = HIBYTE(v17);
      __int16 v78 = 2112;
      id v79 = v31;
      __int16 v80 = 1024;
      int v81 = HIBYTE(v65);
      _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Combining history records [{sequence number: %@, sector combination: %hhu}, {sequence number: %@, sector combination: %hhu}].", buf, 0x22u);
    }
    char v32 = (void *)[v16 copy];
    if (HIDWORD(v19)) {
      unsigned __int8 v33 = v19;
    }
    else {
      unsigned __int8 v33 = v27;
    }
    uint64_t v34 = [NSNumber numberWithInt:v33];
    [v32 setAmountType:v34];

    int v35 = [NSNumber numberWithInt:(v28 + HIDWORD(v19))];
    unint64_t v36 = PKDecimalAmountFromAmount(v35, @"JPY");
    [v32 setAmount:v36];

    if (v65 <= 0x15u
      && ((1 << v65) & 0x380062) != 0
      && v71 <= 0x1Bu
      && ((1 << v71) & 0xFFF7AF8) != 0)
    {
      char v37 = [v16 endStation];
      unsigned __int8 v38 = HIBYTE(v17);
      goto LABEL_25;
    }
    unsigned __int8 v38 = HIBYTE(v17);
    if (IsStartStationAvailable(v65, v71))
    {
      uint64_t v41 = v16;
    }
    else
    {
      if (v17 <= 0x15u
        && ((1 << v17) & 0x380062) != 0
        && HIBYTE(v17) <= 0x1Cu
        && ((1 << SHIBYTE(v17)) & 0x1FFF7AF0) != 0)
      {
        uint64_t v42 = [v15 endStation];
        goto LABEL_37;
      }
      if (!IsStartStationAvailable(v17, HIBYTE(v17)))
      {
        char v37 = 0;
        goto LABEL_41;
      }
      uint64_t v41 = v15;
    }
    uint64_t v42 = [v41 startStation];
LABEL_37:
    char v37 = (void *)v42;
LABEL_25:
    if (IsStartStationAvailable(v17, v38))
    {
      unint64_t v39 = v15;
LABEL_27:
      unint64_t v40 = [v39 startStation];
LABEL_47:
      uint64_t v25 = (uint64_t)v40;
      if (v37 && v40)
      {
        uint64_t v23 = (uint64_t)v37;
        if (([v40 isEqual:v37] & 1) == 0)
        {
LABEL_51:
          id v14 = v32;

          BOOL v22 = v17 == 19 || v65 == 19;
          if (v38 - 4) < 0x19u && ((0x1B5613Du >> (v38 - 4)))
          {
            uint64_t v45 = 1;
          }
          else if ((v71 - 3) >= 0x19u)
          {
            uint64_t v45 = 0;
          }
          else
          {
            uint64_t v45 = qword_1916733B8[(char)(v71 - 3)];
          }
          if ((HIBYTE(v65) - 23) >= 6u && (HIBYTE(v17) - 23) >= 6u) {
            uint64_t v26 = v45;
          }
          else {
            uint64_t v26 = v45 | 2;
          }

          uint64_t v24 = 2;
          goto LABEL_70;
        }
LABEL_50:

        uint64_t v23 = 0;
        goto LABEL_51;
      }
LABEL_140:
      uint64_t v23 = (uint64_t)v37;
      char v37 = (void *)v25;
      if (v25 != v23) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
LABEL_41:
    if (v17 <= 0x15u && ((1 << v17) & 0x380062) != 0 && v38 <= 0x1Cu && ((1 << v38) & 0x1FFF7AF0) != 0)
    {
      int v43 = v15;
    }
    else
    {
      if (IsStartStationAvailable(v65, v71))
      {
        unint64_t v39 = v16;
        goto LABEL_27;
      }
      uint64_t v25 = 0;
      if (v65 > 0x15u) {
        goto LABEL_140;
      }
      if (((1 << v65) & 0x380062) == 0) {
        goto LABEL_140;
      }
      uint64_t v25 = 0;
      if (v71 > 0x1Bu || ((1 << v71) & 0xFFF7AF8) == 0) {
        goto LABEL_140;
      }
      int v43 = v16;
    }
    unint64_t v40 = [v43 endStation];
    goto LABEL_47;
  }
LABEL_70:
  unint64_t v64 = v24;

  a4 = v70;
LABEL_71:
  unint64_t v47 = FelicaTransitHistoryRecordFromFelicaRecord(v14);
  __int16 v48 = v47;
  if ((v47 - 1) > 0x4Bu) {
    uint64_t v49 = 0;
  }
  else {
    uint64_t v49 = qword_191673480[(char)(v47 - 1)];
  }
  unint64_t v73 = HIDWORD(v47);
  if (a4)
  {
    unsigned int v72 = *a4;
    if (v14) {
      goto LABEL_76;
    }
LABEL_82:
    if (v22) {
      uint64_t v53 = 257;
    }
    else {
      uint64_t v53 = v49;
    }
    char v54 = 1;
    goto LABEL_119;
  }
  unsigned int v72 = 0;
  if (!v14) {
    goto LABEL_82;
  }
LABEL_76:
  unint64_t v50 = v47 >> 8;
  v51 = PKLogFacilityTypeGetObject(0xCuLL);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    id v52 = [v14 historySequenceNumber];
    *(_DWORD *)buf = 138412802;
    id v75 = v52;
    __int16 v76 = 1024;
    int v77 = v48;
    __int16 v78 = 1024;
    LODWORD(v79) = HIBYTE(v48);
    _os_log_impl(&dword_190E10000, v51, OS_LOG_TYPE_DEFAULT, "Processing History Record: {sequence number: %@, type: %hhu, sector combination: %hhu}", buf, 0x18u);
  }
  if (!(v23 | v25))
  {
    if (IsStartStationAvailable(v48, v50))
    {
      uint64_t v25 = [v14 startStation];
    }
    else
    {
      uint64_t v25 = 0;
    }
    uint64_t v23 = 0;
    if (v48 <= 0x15u && ((1 << v48) & 0x380062) != 0)
    {
      uint64_t v23 = 0;
      if (v50 <= 0x1Fu && ((1 << v50) & 0xDFFF7AFC) != 0)
      {
        uint64_t v23 = [v14 endStation];
      }
    }
  }
  if (v48 == 19) {
    BOOL v22 = 1;
  }
  uint64_t v55 = v26 | 1;
  if (((1 << v50) & 0x9B5613D8) == 0) {
    uint64_t v55 = v26;
  }
  if (v50 <= 0x1Fu) {
    uint64_t v56 = v55;
  }
  else {
    uint64_t v56 = v26;
  }
  if ((HIBYTE(v48) - 23) >= 6u) {
    uint64_t v26 = v56;
  }
  else {
    uint64_t v26 = v56 | 2;
  }
  if (v22) {
    uint64_t v53 = 257;
  }
  else {
    uint64_t v53 = v49;
  }
  char v54 = 1;
  a4 = v70;
  if (!v70 || v72 == v73) {
    goto LABEL_119;
  }
  if (!v53)
  {
    char v54 = 0;
    if (v72 <= v73) {
      uint64_t v53 = 513;
    }
    else {
      uint64_t v53 = 515;
    }
    goto LABEL_119;
  }
  if (v72 > v73) {
    goto LABEL_115;
  }
  if (v53 != 257)
  {
    if (v53 == 1)
    {
      if ([v69 isInStation])
      {
LABEL_114:
        char v54 = 0;
        uint64_t v53 = 513;
        goto LABEL_119;
      }
      if (!v22)
      {
        char v54 = 0;
        uint64_t v53 = v49;
        goto LABEL_119;
      }
      goto LABEL_113;
    }
LABEL_115:
    char v54 = 0;
    goto LABEL_119;
  }
LABEL_113:
  if ([v69 isInShinkansenStation]) {
    goto LABEL_114;
  }
  char v54 = 0;
  uint64_t v53 = 257;
LABEL_119:
  uint64_t v57 = +[PKPaymentTransaction paymentTransactionWithSource:1];
  [v57 setTransactionType:2];
  [v57 setTransitType:v53];
  [v57 setTransitModifiers:v26];
  uint64_t v58 = [v14 transactionID];
  [v57 setPaymentHash:v58];

  [v57 setOriginatedByDevice:1];
  if ((v54 & 1) == 0)
  {
    id v59 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v59, OS_LOG_TYPE_DEFAULT, "\tProcessed record has balance change.", buf, 2u);
    }

    if (v72 >= v73) {
      uint64_t v60 = v72 - v73;
    }
    else {
      uint64_t v60 = v73 - v72;
    }
    id v61 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v60 exponent:0 isNegative:v72 < v73];
    [v57 setAmount:v61];

    *a4 = v73;
  }
  [v57 setStartStationCode:v25];
  [v57 setEndStationCode:v23];
  if (a7) {
    *a7 = v64;
  }
  if (a8) {
    *a8 = v22;
  }
  id v62 = v57;

  return v62;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[PKFelicaPassProperties alloc] initWithTransitAppletState:self paymentApplication:v4 fieldCollection:0];

  return v5;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3 pass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PKSecureElementPassFieldCollection alloc] initWithBalanceFieldsFromPass:v6];

  uint64_t v9 = [(PKFelicaTransitAppletState *)self transitPassPropertiesWithPaymentApplication:v7 fieldCollection:v8];

  return v9;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3 fieldCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PKFelicaPassProperties alloc] initWithTransitAppletState:self paymentApplication:v7 fieldCollection:v6];

  return v8;
}

- (BOOL)isShinkansenTicketActive
{
  return self->_shinkansenTicketActive;
}

- (void)setShinkansenTicketActive:(BOOL)a3
{
  self->_shinkansenTicketActive = a3;
}

- (BOOL)isGreenCarTicketUsed
{
  return self->_greenCarTicketUsed;
}

- (void)setGreenCarTicketUsed:(BOOL)a3
{
  self->_greenCarTicketUsed = a3;
}

- (BOOL)isBalanceAllowedForCommute
{
  return self->_balanceAllowedForCommute;
}

- (void)setBalanceAllowedForCommute:(BOOL)a3
{
  self->_balanceAllowedForCommute = a3;
}

- (BOOL)isLowBalanceNotificationEnabled
{
  return self->_lowBalanceNotificationEnabled;
}

- (void)setLowBalanceNotificationEnabled:(BOOL)a3
{
  self->_lowBalanceNotificationEnabled = a3;
}

- (NSNumber)shinkansenValidityStartDate
{
  return self->_shinkansenValidityStartDate;
}

- (void)setShinkansenValidityStartDate:(id)a3
{
}

- (NSNumber)shinkansenValidityTerm
{
  return self->_shinkansenValidityTerm;
}

- (void)setShinkansenValidityTerm:(id)a3
{
}

- (NSData)shinkansenOriginStationCode
{
  return self->_shinkansenOriginStationCode;
}

- (void)setShinkansenOriginStationCode:(id)a3
{
}

- (NSData)shinkansenDestinationStationCode
{
  return self->_shinkansenDestinationStationCode;
}

- (void)setShinkansenDestinationStationCode:(id)a3
{
}

- (NSNumber)shinkansenDepartureTime
{
  return self->_shinkansenDepartureTime;
}

- (void)setShinkansenDepartureTime:(id)a3
{
}

- (NSNumber)shinkansenArrivalTime
{
  return self->_shinkansenArrivalTime;
}

- (void)setShinkansenArrivalTime:(id)a3
{
}

- (NSString)shinkansenTrainName
{
  return self->_shinkansenTrainName;
}

- (void)setShinkansenTrainName:(id)a3
{
}

- (NSNumber)shinkansenCarNumber
{
  return self->_shinkansenCarNumber;
}

- (void)setShinkansenCarNumber:(id)a3
{
}

- (NSNumber)shinkansenSeatRow
{
  return self->_shinkansenSeatRow;
}

- (void)setShinkansenSeatRow:(id)a3
{
}

- (NSNumber)shinkansenSeatNumber
{
  return self->_shinkansenSeatNumber;
}

- (void)setShinkansenSeatNumber:(id)a3
{
}

- (NSData)shinkansenSecondaryOriginStationCode
{
  return self->_shinkansenSecondaryOriginStationCode;
}

- (void)setShinkansenSecondaryOriginStationCode:(id)a3
{
}

- (NSData)shinkansenSecondaryDestinationStationCode
{
  return self->_shinkansenSecondaryDestinationStationCode;
}

- (void)setShinkansenSecondaryDestinationStationCode:(id)a3
{
}

- (NSNumber)shinkansenSecondaryDepartureTime
{
  return self->_shinkansenSecondaryDepartureTime;
}

- (void)setShinkansenSecondaryDepartureTime:(id)a3
{
}

- (NSNumber)shinkansenSecondaryArrivalTime
{
  return self->_shinkansenSecondaryArrivalTime;
}

- (void)setShinkansenSecondaryArrivalTime:(id)a3
{
}

- (NSString)shinkansenSecondaryTrainName
{
  return self->_shinkansenSecondaryTrainName;
}

- (void)setShinkansenSecondaryTrainName:(id)a3
{
}

- (NSNumber)shinkansenSecondaryCarNumber
{
  return self->_shinkansenSecondaryCarNumber;
}

- (void)setShinkansenSecondaryCarNumber:(id)a3
{
}

- (NSNumber)shinkansenSecondarySeatRow
{
  return self->_shinkansenSecondarySeatRow;
}

- (void)setShinkansenSecondarySeatRow:(id)a3
{
}

- (NSNumber)shinkansenSecondarySeatNumber
{
  return self->_shinkansenSecondarySeatNumber;
}

- (void)setShinkansenSecondarySeatNumber:(id)a3
{
}

- (BOOL)hasShinkansenTicket
{
  return self->_hasShinkansenTicket;
}

- (void)setHasShinkansenTicket:(BOOL)a3
{
  self->_hasShinkansenTicket = a3;
}

- (NSData)greenCarOriginStationCode
{
  return self->_greenCarOriginStationCode;
}

- (void)setGreenCarOriginStationCode:(id)a3
{
}

- (NSData)greenCarDestinationStationCode
{
  return self->_greenCarDestinationStationCode;
}

- (void)setGreenCarDestinationStationCode:(id)a3
{
}

- (NSNumber)greenCarValidityStartDate
{
  return self->_greenCarValidityStartDate;
}

- (void)setGreenCarValidityStartDate:(id)a3
{
}

- (BOOL)hasGreenCarTicket
{
  return self->_hasGreenCarTicket;
}

- (void)setHasGreenCarTicket:(BOOL)a3
{
  self->_hasGreenCarTicket = a3;
}

- (NSString)shinkansenOriginStationString
{
  return self->_shinkansenOriginStationString;
}

- (void)setShinkansenOriginStationString:(id)a3
{
}

- (NSString)shinkansenDestinationStationString
{
  return self->_shinkansenDestinationStationString;
}

- (void)setShinkansenDestinationStationString:(id)a3
{
}

- (NSString)shinkansenSecondaryOriginStationString
{
  return self->_shinkansenSecondaryOriginStationString;
}

- (void)setShinkansenSecondaryOriginStationString:(id)a3
{
}

- (NSString)shinkansenSecondaryDestinationStationString
{
  return self->_shinkansenSecondaryDestinationStationString;
}

- (void)setShinkansenSecondaryDestinationStationString:(id)a3
{
}

- (NSString)greenCarOriginStationString
{
  return self->_greenCarOriginStationString;
}

- (void)setGreenCarOriginStationString:(id)a3
{
}

- (NSString)greenCarDestinationStationString
{
  return self->_greenCarDestinationStationString;
}

- (void)setGreenCarDestinationStationString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenCarDestinationStationString, 0);
  objc_storeStrong((id *)&self->_greenCarOriginStationString, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryDestinationStationString, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryOriginStationString, 0);
  objc_storeStrong((id *)&self->_shinkansenDestinationStationString, 0);
  objc_storeStrong((id *)&self->_shinkansenOriginStationString, 0);
  objc_storeStrong((id *)&self->_greenCarValidityStartDate, 0);
  objc_storeStrong((id *)&self->_greenCarDestinationStationCode, 0);
  objc_storeStrong((id *)&self->_greenCarOriginStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondarySeatNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondarySeatRow, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryCarNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryTrainName, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryArrivalTime, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryDepartureTime, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryDestinationStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenSecondaryOriginStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenSeatNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenSeatRow, 0);
  objc_storeStrong((id *)&self->_shinkansenCarNumber, 0);
  objc_storeStrong((id *)&self->_shinkansenTrainName, 0);
  objc_storeStrong((id *)&self->_shinkansenArrivalTime, 0);
  objc_storeStrong((id *)&self->_shinkansenDepartureTime, 0);
  objc_storeStrong((id *)&self->_shinkansenDestinationStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenOriginStationCode, 0);
  objc_storeStrong((id *)&self->_shinkansenValidityTerm, 0);
  objc_storeStrong((id *)&self->_shinkansenValidityStartDate, 0);
}

@end