import 'dart:convert';

import 'package:covid_tracker/Model/World_states_model.dart';
import 'package:covid_tracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;


class StatesServices{

  Future<WorldStatesModel> fetchWorldStatesRecord()async{
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode==200){

      var data=jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi()async{
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if(response.statusCode==200){

      var data=jsonDecode(response.body);
      return data;
    }else{
      throw Exception('Error');
    }
  }

}