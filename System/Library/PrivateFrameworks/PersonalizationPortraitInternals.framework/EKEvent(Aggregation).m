@interface EKEvent(Aggregation)
- (BOOL)pp_isConnectionFromFlight:()Aggregation;
- (id)pp_airports;
- (id)pp_boatReservationTitle;
- (id)pp_busReservationTitle;
- (id)pp_carRentalDropoffReservationTitle;
- (id)pp_carRentalPickupReservationTitle;
- (id)pp_foodReservationTitle;
- (id)pp_locationString;
- (id)pp_lodgingName;
- (id)pp_trainReservationTitle;
- (uint64_t)pp_isDupeOfBoatEvent:()Aggregation;
- (uint64_t)pp_isDupeOfBusEvent:()Aggregation;
- (uint64_t)pp_isDupeOfCarRentalDropoffEvent:()Aggregation;
- (uint64_t)pp_isDupeOfCarRentalPickupEvent:()Aggregation;
- (uint64_t)pp_isDupeOfEvent:()Aggregation forCategory:;
- (uint64_t)pp_isDupeOfFlightEvent:()Aggregation;
- (uint64_t)pp_isDupeOfFoodEvent:()Aggregation;
- (uint64_t)pp_isDupeOfLodgingEvent:()Aggregation;
- (uint64_t)pp_isDupeOfTrainEvent:()Aggregation;
- (uint64_t)pp_suggestedCategory;
@end

@implementation EKEvent(Aggregation)

- (uint64_t)pp_isDupeOfFoodEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 2);
}

- (id)pp_foodReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 2);
}

- (uint64_t)pp_isDupeOfCarRentalDropoffEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 7);
}

- (id)pp_carRentalDropoffReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 7);
}

- (uint64_t)pp_isDupeOfCarRentalPickupEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 6);
}

- (id)pp_carRentalPickupReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 6);
}

- (uint64_t)pp_isDupeOfTrainEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 3);
}

- (id)pp_trainReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 3);
}

- (uint64_t)pp_isDupeOfBoatEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 5);
}

- (id)pp_busReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 4);
}

- (uint64_t)pp_isDupeOfBusEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 4);
}

- (id)pp_boatReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 5);
}

- (uint64_t)pp_isDupeOfLodgingEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 10);
}

- (id)pp_lodgingName
{
  return -[EKEvent pp_eventNameForCategory:](a1, 10);
}

- (uint64_t)pp_isDupeOfEvent:()Aggregation forCategory:
{
  id v6 = a3;
  v7 = v6;
  if (a4 != 1)
  {
    v9 = [v6 startDate];
    v10 = [a1 startDate];
    [v9 timeIntervalSinceDate:v10];
    if (v11 <= 86400.0)
    {
      v12 = [v7 endDate];
      v13 = [a1 endDate];
      [v12 timeIntervalSinceDate:v13];
      double v15 = v14;

      if (v15 <= 86400.0)
      {
        v16 = -[EKEvent pp_eventNameForCategory:](a1, a4);
        uint64_t v17 = -[EKEvent pp_eventNameForCategory:](v7, a4);
        v18 = (void *)v17;
        if (v16 && v17 && ([v16 isEqualToString:v17] & 1) != 0)
        {

          uint64_t v8 = 1;
          goto LABEL_12;
        }
      }
    }
    else
    {
    }
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = objc_msgSend(a1, "pp_isDupeOfFlightEvent:", v6);
LABEL_12:

  return v8;
}

- (uint64_t)pp_isDupeOfFlightEvent:()Aggregation
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pp_airports");
  id v6 = [v5 first];
  v7 = [v6 iataCode];
  uint64_t v8 = objc_msgSend(v4, "pp_airports");
  v9 = [v8 first];
  v10 = [v9 iataCode];
  if (![v7 isEqualToString:v10])
  {

    goto LABEL_6;
  }
  v21 = a1;
  v23 = objc_msgSend(a1, "pp_airports");
  double v11 = [v23 second];
  v12 = [v11 iataCode];
  objc_msgSend(v4, "pp_airports");
  v13 = v25 = v4;
  double v14 = [v13 second];
  [v14 iataCode];
  double v15 = v24 = v5;
  int v22 = [v12 isEqualToString:v15];

  id v4 = v25;
  if (v22)
  {
    v5 = [v21 startDate];
    uint64_t v16 = [v25 startDate];
    if (v5 != (void *)v16)
    {
      id v6 = (void *)v16;
LABEL_6:

      goto LABEL_7;
    }
    v19 = [v21 endDate];
    v20 = [v25 endDate];

    if (v19 == v20)
    {
      uint64_t v17 = 1;
      goto LABEL_8;
    }
  }
LABEL_7:
  uint64_t v17 = 0;
LABEL_8:

  return v17;
}

- (id)pp_airports
{
  v2 = (void *)MEMORY[0x1CB79D060]();
  v3 = [a1 customObjectForKey:*MEMORY[0x1E4F8A1B0]];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
    v5 = v4;
    if (v4 && [v4 count])
    {
      id v6 = [v5 objectAtIndexedSubscript:0];
      v7 = [v6 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"departureAirport"];
      v9 = [v8 objectForKeyedSubscript:@"iataCode"];

      if (!v9 || ![v9 length])
      {
        v10 = [v5 objectAtIndexedSubscript:0];
        double v11 = [v10 objectForKeyedSubscript:@"reservationFor"];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"departureAirportCode"];

        v9 = (void *)v12;
      }
      v13 = [v5 objectAtIndexedSubscript:0];
      double v14 = [v13 objectForKeyedSubscript:@"reservationFor"];
      double v15 = [v14 objectForKeyedSubscript:@"departureAirport"];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"name"];

      v32 = (void *)v16;
      uint64_t v17 = [[PPFlightAirport alloc] initWithName:v16 iataCode:v9 role:0];
      v18 = [v5 objectAtIndexedSubscript:0];
      v19 = [v18 objectForKeyedSubscript:@"reservationFor"];
      v20 = [v19 objectForKeyedSubscript:@"arrivalAirport"];
      v21 = [v20 objectForKeyedSubscript:@"iataCode"];

      if (!v21 || ![v21 length])
      {
        int v22 = [v5 objectAtIndexedSubscript:0];
        v23 = [v22 objectForKeyedSubscript:@"reservationFor"];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"arrivalAirportCode"];

        v21 = (void *)v24;
      }
      v25 = [v5 objectAtIndexedSubscript:0];
      v26 = [v25 objectForKeyedSubscript:@"reservationFor"];
      v27 = [v26 objectForKeyedSubscript:@"arrivalAirport"];
      v28 = [v27 objectForKeyedSubscript:@"name"];

      v29 = [[PPFlightAirport alloc] initWithName:v28 iataCode:v21 role:1];
      v30 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v17 second:v29];
    }
    else
    {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)pp_isConnectionFromFlight:()Aggregation
{
  id v4 = a3;
  if ([a1 isEqual:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1CB79D060]();
    v7 = objc_msgSend(a1, "pp_airports");
    uint64_t v8 = objc_msgSend(v4, "pp_airports");
    v9 = [v7 second];
    v10 = [v8 first];
    char v11 = [v9 isEqualToPPFlightAirport:v10];

    if (v11)
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v12 = [v4 startDate];
      v13 = [a1 endDate];
      [v12 timeIntervalSinceDate:v13];
      double v15 = v14;

      if (v15 <= 5184000.0)
      {
        uint64_t v16 = [a1 endLocation];
        uint64_t v17 = [v16 geoLocation];

        v18 = [v4 structuredLocation];
        v19 = [v18 geoLocation];

        BOOL v5 = 0;
        if (v17)
        {
          if (v19)
          {
            [v17 distanceFromLocation:v19];
            if (v20 < 100000.0) {
              BOOL v5 = 1;
            }
          }
        }
      }
      else
      {
        BOOL v5 = 0;
      }
    }
  }

  return v5;
}

- (id)pp_locationString
{
  v2 = (void *)MEMORY[0x1CB79D060]();
  switch(objc_msgSend(a1, "pp_suggestedCategory"))
  {
    case 1u:
      v3 = [a1 structuredLocation];
      uint64_t v4 = [v3 title];
      if (v4)
      {
        BOOL v5 = (void *)v4;
        id v6 = [a1 structuredLocation];
        v7 = [v6 title];
        uint64_t v8 = [v7 length];

        if (v8) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      v55 = objc_msgSend(a1, "pp_airports");
      v53 = [v55 second];

      if (!v53) {
        goto LABEL_35;
      }
      uint64_t v56 = [v53 name];
      if (!v56) {
        goto LABEL_35;
      }
      v57 = (void *)v56;
      v58 = [v53 name];
      uint64_t v59 = [v58 length];

      if (v59)
      {
        uint64_t v54 = [v53 name];
      }
      else
      {
LABEL_35:
        uint64_t v54 = [v53 iataCode];
      }
      goto LABEL_29;
    case 2u:
      v9 = [a1 structuredLocation];
      uint64_t v10 = [v9 title];
      if (v10)
      {
        char v11 = (void *)v10;
        uint64_t v12 = [a1 structuredLocation];
        v13 = [v12 title];
        uint64_t v14 = [v13 length];

        if (v14) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      uint64_t v60 = objc_msgSend(a1, "pp_foodReservationTitle");
      goto LABEL_50;
    case 3u:
      double v15 = [a1 structuredLocation];
      uint64_t v16 = [v15 title];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        v18 = [a1 structuredLocation];
        v19 = [v18 title];
        uint64_t v20 = [v19 length];

        if (v20) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      uint64_t v60 = objc_msgSend(a1, "pp_trainReservationTitle");
      goto LABEL_50;
    case 4u:
      v21 = [a1 structuredLocation];
      uint64_t v22 = [v21 title];
      if (v22)
      {
        v23 = (void *)v22;
        uint64_t v24 = [a1 structuredLocation];
        v25 = [v24 title];
        uint64_t v26 = [v25 length];

        if (v26) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      uint64_t v60 = objc_msgSend(a1, "pp_busReservationTitle");
      goto LABEL_50;
    case 5u:
      v27 = [a1 structuredLocation];
      uint64_t v28 = [v27 title];
      if (v28)
      {
        v29 = (void *)v28;
        v30 = [a1 structuredLocation];
        v31 = [v30 title];
        uint64_t v32 = [v31 length];

        if (v32) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      uint64_t v60 = objc_msgSend(a1, "pp_boatReservationTitle");
      goto LABEL_50;
    case 6u:
      v33 = [a1 structuredLocation];
      uint64_t v34 = [v33 title];
      if (v34)
      {
        v35 = (void *)v34;
        v36 = [a1 structuredLocation];
        v37 = [v36 title];
        uint64_t v38 = [v37 length];

        if (v38) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      uint64_t v60 = objc_msgSend(a1, "pp_carRentalPickupReservationTitle");
      goto LABEL_50;
    case 7u:
      v39 = [a1 structuredLocation];
      uint64_t v40 = [v39 title];
      if (v40)
      {
        v41 = (void *)v40;
        v42 = [a1 structuredLocation];
        v43 = [v42 title];
        uint64_t v44 = [v43 length];

        if (v44) {
          goto LABEL_28;
        }
      }
      else
      {
      }
      uint64_t v60 = objc_msgSend(a1, "pp_carRentalDropoffReservationTitle");
      goto LABEL_50;
    case 0xAu:
      v47 = [a1 structuredLocation];
      uint64_t v48 = [v47 title];
      if (v48)
      {
        v49 = (void *)v48;
        v50 = [a1 structuredLocation];
        v51 = [v50 title];
        uint64_t v52 = [v51 length];

        if (v52)
        {
LABEL_28:
          v53 = [a1 structuredLocation];
          uint64_t v54 = [v53 title];
LABEL_29:
          v46 = (void *)v54;

          goto LABEL_51;
        }
      }
      else
      {
      }
      uint64_t v60 = objc_msgSend(a1, "pp_lodgingName");
LABEL_50:
      v46 = (void *)v60;
LABEL_51:
      v61 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      v62 = [v46 componentsSeparatedByCharactersInSet:v61];
      v63 = objc_msgSend(v62, "_pas_componentsJoinedByString:", @" ");

      return v63;
    default:
      v45 = pp_default_log_handle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v65 = 0;
        _os_log_fault_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_FAULT, "[EKEvent+Aggregation pp_location] Dealing with an unexpected PPSuggestedEventCategory", v65, 2u);
      }

      v46 = 0;
      goto LABEL_51;
  }
}

- (uint64_t)pp_suggestedCategory
{
  v2 = (void *)MEMORY[0x1CB79D060]();
  v3 = [a1 customObjectForKey:*MEMORY[0x1E4F8A1B0]];
  if (v3) {
    uint64_t v4 = [MEMORY[0x1E4F89E00] suggestedEventCategoryFromMetadata:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

@end